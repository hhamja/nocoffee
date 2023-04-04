import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.router.pop();
      },
      child: const Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 16, 10),
        child: Icon(CupertinoIcons.back),
      ),
    );
  }
}
