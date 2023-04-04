import 'package:flutter/material.dart';

class HomeRecordPage extends StatelessWidget {
  const HomeRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(
            'assets/app_icon/petpick.png',
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text('커피 기록 페이지'),
      ),
    );
  }
}
