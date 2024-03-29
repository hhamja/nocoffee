import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/calendar_coffee_data_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/provider/coffee_data_for_date_provider.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/home/home_text_field_box.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/home/one_week_calendar_box.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/home/record_icon.dart';
import 'package:nocoffee/src/features/common/presentation/widget/async_value/custom_error_data.dart';
import 'package:nocoffee/src/features/common/presentation/widget/dialog/one_button_dialog.dart';
import 'package:nocoffee/src/features/common/presentation/widget/loading/circular_loading.dart';
import 'package:nocoffee/src/features/common/presentation/widget/text_button/custom_fill_text_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeRecordPage extends ConsumerStatefulWidget {
  const HomeRecordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeRecordPageState();
}

class _HomeRecordPageState extends ConsumerState<HomeRecordPage> {
  TextEditingController cupTextController = TextEditingController();
  TextEditingController costTextController = TextEditingController();
  TextEditingController memoTextController = TextEditingController();
  final FocusNode _cupFocusNode = FocusNode();
  final FocusNode _costFocusNode = FocusNode();
  final FocusNode _memoFocusNode = FocusNode();

  DateTime _focusedDay = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);

  // 기록완료 하단 토스트
  void showBottomToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: WHITE_COLOR,
      textColor: TEXT_COLOR,
      fontSize: 16.0,
    );
  }

  @override
  void initState() {
    super.initState();
    final CoffeeDataModel coffeeDataForDate =
        ref.read(coffeeDataForDateProvider(_focusedDay));
    cupTextController.text = coffeeDataForDate.coffeeCup;
    costTextController.text = coffeeDataForDate.coffeeCost;
    memoTextController.text = coffeeDataForDate.memo;
  }

  @override
  void dispose() {
    cupTextController.dispose();
    costTextController.dispose();
    memoTextController.dispose();
    // 키보드 포커스 풀기
    _cupFocusNode.unfocus();
    _costFocusNode.unfocus();
    _memoFocusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allCoffeeData = ref.watch(calendarCoffeeDataProvider);

    // 기록하기 버튼 클릭 시
    Future clickRecordButton() async {
      // 키보드 포커스 풀기
      _cupFocusNode.unfocus();
      _costFocusNode.unfocus();
      _memoFocusNode.unfocus();
      if (cupTextController.text.isNotEmpty &&
          costTextController.text.isNotEmpty) {
        // coffee 박스에 데이터 넣기
        await ref.read(coffeeRepositoryProvider).addCoffeeData(
              _focusedDay,
              cupTextController.text,
              costTextController.text,
              memoTextController.text,
            );
        showBottomToast('기록완료');
        return ref.refresh(calendarCoffeeDataProvider.future);
      } else {
        return null;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFf0f2f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf0f2f5),
        leadingWidth: 89,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            'assets/app_icon/coffee_stop.png',
          ),
        ),
        actions: [
          RecordIconButton(
            onPressed: cupTextController.text.isNotEmpty &&
                    costTextController.text.isNotEmpty
                ? () async => await clickRecordButton()
                : () async => showDialog(
                      context: context,
                      builder: (context) => const CustomOneButtonDialog(
                        content: '커피 잔과 금액을\n입력해주세요.',
                        completeText: '확인',
                      ),
                    ),
          )
        ],
      ),
      body: allCoffeeData.when(
        data: (Map<DateTime, List<CoffeeDataModel>> data) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  OneWeekCalendarBox(
                    calendarFormat: CalendarFormat.week,
                    focusedDay: _focusedDay,
                    // event리스트를 반환하는 eventloader
                    eventLoader: (DateTime day) {
                      return data[day] ?? [];
                    },
                    onDaySelected:
                        (DateTime selectedDay, DateTime focusedDay) async {
                      // 선택한 날짜의 값을 불러와서 업데이트
                      // 없다면 ? ''
                      setState(() {
                        cupTextController.text =
                            data[selectedDay.toUtc()]?[0].coffeeCup ?? '';
                        costTextController.text =
                            data[selectedDay.toUtc()]?[0].coffeeCost ?? '';
                        memoTextController.text =
                            data[selectedDay.toUtc()]?[0].memo ?? '';
                        _focusedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                  ),
                  const SizedBox(height: 21),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: HomeTextFieldBox(
                          focusNode: _cupFocusNode,
                          boxOntTap: () async => _cupFocusNode.requestFocus(),
                          inputFormatters: [
                            // 첫 숫자로 0입력 안되게 하기
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^[1-9]\d*'),
                            ),
                          ],
                          unitWidget: cupTextController.text.isNotEmpty
                              ? const Text(
                                  '잔',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    height: 1.5,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          title: '커피 수',
                          hintText: '입력하기',
                          onChanged: (value) => {setState(() => value)},
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.end,
                          keyboardType: TextInputType.number,
                          textController: cupTextController,
                          maxLine: 1,
                          maxLength: 2,
                          itemHeightSpace: 34,
                        ),
                      ),
                      const SizedBox(width: 13),
                      Expanded(
                        child: HomeTextFieldBox(
                          focusNode: _costFocusNode,
                          boxOntTap: () async => _costFocusNode.requestFocus(),
                          unitWidget: costTextController.text.isNotEmpty
                              ? const Text(
                                  '원',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    height: 1.5,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          title: '커피에 쓴 돈',
                          hintText: '입력하기',
                          onChanged: (value) => setState(() => value),
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.end,
                          keyboardType: TextInputType.number,
                          textController: costTextController,
                          maxLine: 1,
                          maxLength: 7,
                          inputFormatters: [
                            // 화폐형식으로 바꾸기
                            CurrencyTextInputFormatter(
                              locale: 'ko',
                              decimalDigits: 0,
                              symbol: '',
                            ),
                          ],
                          itemHeightSpace: 34,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 21),
                  HomeTextFieldBox(
                    focusNode: _memoFocusNode,
                    boxOntTap: () async => _memoFocusNode.requestFocus(),
                    unitWidget: const SizedBox.shrink(),
                    title: '메모',
                    onChanged: (value) => setState(() => value),
                    hintText: '입력하기(선택사항)',
                    textAlign: TextAlign.start,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    textController: memoTextController,
                    maxLine: null,
                    maxLength: 100,
                    itemHeightSpace: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 34),
                    child: CustomFilledTextButton(
                      w: MediaQuery.of(context).size.width,
                      h: 55,
                      content: '기록하기',
                      onPressed: cupTextController.text.isNotEmpty &&
                              costTextController.text.isNotEmpty
                          ? () async => clickRecordButton()
                          : () async => showDialog(
                                context: context,
                                builder: (context) =>
                                    const CustomOneButtonDialog(
                                  content: '커피 잔과 금액을\n입력해주세요.',
                                  completeText: '확인',
                                ),
                              ),
                      backgroundColor: cupTextController.text.isNotEmpty &&
                              costTextController.text.isNotEmpty
                          ? PRIMARY_COLOR
                          : LIGHT_GREY_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => const CustomErrorData(),
        loading: () => const CustomCircularLoading(),
      ),
    );
  }
}
