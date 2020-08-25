import 'package:bible_journal/core/utils/color_util.dart';
import 'package:bible_journal/presentation/widgets/texts/description_text.dart';
import 'package:flutter/material.dart';

class TagCardWidget extends StatelessWidget {
  final String tagText;

  const TagCardWidget({Key key, this.tagText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 55.0,
      decoration: BoxDecoration(
        color: ColorUtil.primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Center(
        child: DescriptionText(
          text: tagText ?? "",
          fontSize: 8,
          color: ColorUtil.primaryBackgroundColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
