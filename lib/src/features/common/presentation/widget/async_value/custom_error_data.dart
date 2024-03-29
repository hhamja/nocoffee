import 'package:flutter/cupertino.dart';
import 'package:nocoffee/src/config/constant/app_color.dart';

class CustomErrorData extends StatelessWidget {
  const CustomErrorData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.wifi_exclamationmark,
            size: 150,
            color: LIGHT_GREY_COLOR,
          ),
          const SizedBox(height: 13),
          const Text(
            '네트워크 오류',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 89),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '1. 데이터 연결 상태를 확인해주세요.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 34),
              Text(
                '2. 앱을 재시작 해주세요.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 34),
              Text(
                '3. 고객센터에 문의해주세요.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
