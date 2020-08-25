import 'package:bible_journal/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;
  final bool hasLimit;

  DescriptionText(
      {@required this.text,
      this.fontWeight,
      this.fontSize = 13,
      this.textAlign,
      this.color,
      this.hasLimit = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        height: 1.5,
        fontSize: fontSize,
        color: color ?? ColorUtil.primaryTextColor,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
      textAlign: textAlign ?? TextAlign.left,
      maxLines: hasLimit ? 5 : 100,
      overflow: TextOverflow.fade,
    );
  }
}
