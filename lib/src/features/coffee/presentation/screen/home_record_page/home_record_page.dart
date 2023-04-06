import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/data/coffee_repository.dart';
import 'package:nocoffee/src/features/coffee/domain/coffee_data_model.dart';
import 'package:nocoffee/src/features/coffee/presentation/controller/home_coffee_record_controller.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/home_text_field_box.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/one_week_calendar_box.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/record_icon.dart';
import 'package:nocoffee/src/features/common/presentation/widget/dialog/one_button_dialog.dart';
import 'package:nocoffee/src/features/common/presentation/widget/text_button/custom_fill_text_button.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String name;
  Event(this.name);
}

class HomeRecordPage extends ConsumerStatefulWidget {
  const HomeRecordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeRecordPageState();
}

class _HomeRecordPageState extends ConsumerState<HomeRecordPage> {
  final TextEditingController cupTextController = TextEditingController();
  final TextEditingController costTextController = TextEditingController();
  final TextEditingController memoTextController = TextEditingController();
  CoffeeDataModel? coffeeRecordForDate;

  // 임의의 event Map 데이터
  Map<DateTime, List<Event>> events = {
    DateTime.utc(2023, 4, 4): [Event('title'), Event('title2')],
    DateTime.utc(2022, 4, 5): [Event('title3')],
  };

  // event리스트를 반환하는 eventloader
  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  DateTime _focusedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      coffeeRecordForDate = ref.watch(coffeeDataForDateProvider(_focusedDay));
      cupTextController.text = coffeeRecordForDate?.coffeeCup ?? '';
      costTextController.text = coffeeRecordForDate?.coffeeCost ?? '';
      memoTextController.text = coffeeRecordForDate?.memo ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf0f2f5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFf0f2f5),
        leadingWidth: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            'assets/app_icon/petpick.png',
          ),
        ),
        actions: [
          RecordIconButton(
            onPressed: cupTextController.text.isNotEmpty &&
                    costTextController.text.isNotEmpty
                ? () async =>
                    ref.read(coffeeDataController.notifier).addCoffeeData(
                          _focusedDay,
                          cupTextController.text,
                          costTextController.text,
                          memoTextController.text,
                        )
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              OneWeekCalendarBox(
                calendarFormat: CalendarFormat.week,
                focusedDay: _focusedDay,
                eventLoader: _getEventsForDay,
                onDaySelected:
                    (DateTime selectedDay, DateTime focusedDay) async {
                  setState(() {
                    _focusedDay = selectedDay;
                    // _focusedDay = focusedDay;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: HomeTextFieldBox(
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
                      hintText: '미입력',
                      onChanged: (value) => setState(() => value),
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
                      hintText: '미입력',
                      onChanged: (value) => setState(() => value),
                      textInputAction: TextInputAction.next,
                      textAlign: TextAlign.end,
                      keyboardType: TextInputType.number,
                      textController: costTextController,
                      maxLine: 1,
                      maxLength: 7,
                      inputFormatters: [
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
                unitWidget: const SizedBox.shrink(),
                title: '메모',
                onChanged: (value) => setState(() => value),
                hintText: '미입력(선택사항)',
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                textController: memoTextController,
                maxLine: null,
                maxLength: 100,
                itemHeightSpace: 8,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomFilledTextButton(
          w: MediaQuery.of(context).size.width,
          h: 54,
          content: '기록하기',
          onPressed: cupTextController.text.isNotEmpty &&
                  costTextController.text.isNotEmpty
              ? () async =>
                  ref.read(coffeeDataController.notifier).addCoffeeData(
                        _focusedDay,
                        cupTextController.text,
                        costTextController.text,
                        memoTextController.text,
                      )
              : () async => showDialog(
                    context: context,
                    builder: (context) => const CustomOneButtonDialog(
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
    );
  }
}
