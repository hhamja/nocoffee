import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget body;
  final Widget? title;
  final Widget? leading;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;

  const DefaultLayout({
    required this.body,
    this.title,
    this.leading,
    this.actions,
    this.bottomNavigationBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: leading != null ? 0 : 20,
        centerTitle: false,
        title: title,
        leading: leading != null
            ? Container(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                alignment: Alignment.centerLeft,
                child: leading,
              )
            : leading,
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: body,
      ),
      bottomSheet: Padding(
        padding: bottomNavigationBar == null
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: bottomNavigationBar,
      ),
    );
  }
}
