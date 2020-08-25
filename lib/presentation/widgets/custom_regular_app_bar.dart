import 'package:bible_journal/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class CustomRegularAppBar extends StatelessWidget {
  final String title;
  final Widget body;
  final Color backgroundColor;
  final VoidCallback onBackTap;
  final bool hasBackButton;

  const CustomRegularAppBar({
    Key key,
    this.title,
    this.body,
    this.backgroundColor,
    this.onBackTap,
    this.hasBackButton = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor ?? ColorUtil.primaryColor,
        centerTitle: true,
        elevation: 0.0,
        leading: hasBackButton
            ? GestureDetector(
                onTap: onBackTap ??
                    () {
                      Navigator.pop(context);
                    },
                child: Icon(
                  Icons.arrow_back,
                  color: ColorUtil.primaryTextColor,
                ),
              )
            : Container(),
        title: Text(
          title ?? "",
          style: TextStyle(
            color: ColorUtil.primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: body,
      ),
    );
  }
}
