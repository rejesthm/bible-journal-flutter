import 'package:bible_journal/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;

  HeaderTextWidget(
      {@required this.title,
      this.fontWeight = FontWeight.w600,
      this.fontSize = 17,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(title ?? "",
        style: TextStyle(
          height: 1.0,
          fontSize: fontSize,
          color: color ?? ColorUtil.primaryColor,
          fontWeight: fontWeight,
        ));
  }
}
