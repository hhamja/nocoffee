import 'package:flutter/material.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/home_text_box.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/one_week_calendar_box.dart';
import 'package:nocoffee/src/features/coffee/presentation/widget/record_icon.dart';
import 'package:nocoffee/src/features/common/presentation/widget/dialog/one_button_dialog.dart';
import 'package:nocoffee/src/features/common/presentation/widget/dialog/small_dialog.dart';
import 'package:nocoffee/src/features/common/presentation/widget/icon_button/custom_close_button.dart';
import 'package:nocoffee/src/features/common/presentation/widget/text_button/custom_fill_text_button.dart';
import 'package:nocoffee/src/features/common/presentation/widget/text_form_field/custom_text_form_filed.dart';

class HomeRecordPage extends StatefulWidget {
  const HomeRecordPage({super.key});

  @override
  State<HomeRecordPage> createState() => _HomeRecordPageState();
}

class _HomeRecordPageState extends State<HomeRecordPage> {
  final TextEditingController cupTextController = TextEditingController();
  final TextEditingController costTextController = TextEditingController();
  final TextEditingController memoTextController = TextEditingController();

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
                ? () async {
                    // hive에 저장하기
                  }
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
              const OneWeekCalendarBox(),
              const SizedBox(height: 21),
              HomeTextBox(
                title: '오늘 마신 커피',
                content: cupTextController.text.isEmpty ? null : '잔',
                textFormField: CustomTextFormField(
                  hintText: '미입력',
                  onChanged: (value) => setState(() => value),
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  controller: cupTextController,
                  maxLine: 1,
                  maxLength: 2,
                ),
              ),
              const SizedBox(height: 21),
              HomeTextBox(
                title: '오늘 커피에 쓴 돈',
                content: costTextController.text.isEmpty ? null : '원',
                textFormField: CustomTextFormField(
                  hintText: '미입력',
                  onChanged: (value) => setState(() => value),
                  textInputAction: TextInputAction.next,
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  controller: costTextController,
                  maxLine: 1,
                  maxLength: 7,
                  inputFormatters: [
                    CurrencyTextInputFormatter(
                      locale: 'ko',
                      decimalDigits: 0,
                      symbol: '',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 21),
              HomeTextBox(
                title: '메모',
                content: null,
                textFormField: CustomTextFormField(
                  onChanged: (value) => setState(() => value),
                  hintText: '미입력(선택사항)',
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  controller: memoTextController,
                  maxLine: null,
                  maxLength: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 34),
                child: CustomFilledTextButton(
                  w: MediaQuery.of(context).size.width,
                  h: 54,
                  content: '기록하기',
                  onPressed: cupTextController.text.isNotEmpty &&
                          costTextController.text.isNotEmpty
                      ? () async {
                          // hive에 저장하기
                        }
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
            ],
          ),
        ),
      ),
    );
  }
}
