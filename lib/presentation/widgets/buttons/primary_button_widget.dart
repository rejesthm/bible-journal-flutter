import 'package:bible_journal/core/utils/color_util.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key key,
    @required this.text,
    this.height,
    this.width,
    this.fontSize,
    this.radius,
    this.onPressed,
    this.color,
  }) : super(key: key);

  final String text;
  final double height;
  final double width;
  final double fontSize;
  final double radius;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? 55.0,
      width: this.width ?? double.infinity,
      child: FlatButton(
        onPressed: onPressed ?? () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.radius ?? 25)),
        color: color ?? ColorUtil.primaryColor,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: this.fontSize ?? 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
