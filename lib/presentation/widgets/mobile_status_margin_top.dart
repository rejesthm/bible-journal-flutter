import 'package:bible_journal/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class MobileStatusMarginTop extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  MobileStatusMarginTop({this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.primaryBackgroundColor,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: child,
    );
  }
}
