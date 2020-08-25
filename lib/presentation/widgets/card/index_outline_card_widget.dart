import 'package:bible_journal/core/utils/color_util.dart';
import 'package:bible_journal/core/utils/routes/routes_list.dart';
import 'package:bible_journal/presentation/widgets/images/circle_image_widget.dart';
import 'package:bible_journal/presentation/widgets/properties/shadow_widget.dart';
import 'package:bible_journal/presentation/widgets/texts/description_text.dart';
import 'package:bible_journal/presentation/widgets/texts/header_text_widget.dart';
import 'package:flutter/material.dart';

class IndexOutlineCardWidget extends StatelessWidget {
  final String imageUrl;
  final String journalTitle;
  final String authorName;

  const IndexOutlineCardWidget(
      {Key key, this.imageUrl, this.journalTitle, this.authorName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DETAILED_JOURNAL_ROUTE);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: ShadowWidget(
          child: Container(
            height: 70.0,
            width: width,
            decoration: BoxDecoration(
              color: ColorUtil.primaryBackgroundColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  CircleImage(
                    imageUrl: imageUrl,
                    size: 50,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderTextWidget(
                          title: journalTitle,
                          color: ColorUtil.primaryTextColor,
                        ),
                        DescriptionText(
                          text: authorName,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
