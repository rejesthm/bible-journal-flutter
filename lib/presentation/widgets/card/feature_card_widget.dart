import 'package:bible_journal/core/utils/color_util.dart';
import 'package:bible_journal/presentation/widgets/card/tag_card_widget.dart';
import 'package:bible_journal/presentation/widgets/images/circle_image_widget.dart';
import 'package:bible_journal/presentation/widgets/properties/shadow_widget.dart';
import 'package:bible_journal/presentation/widgets/texts/description_text.dart';
import 'package:bible_journal/presentation/widgets/texts/header_text_widget.dart';
import 'package:flutter/material.dart';

class FeatureCardWidget extends StatelessWidget {
  final String imageUrl;
  final String journalTitle;
  final String authorName;
  final String description;

  const FeatureCardWidget({
    Key key,
    @required this.imageUrl,
    @required this.journalTitle,
    @required this.authorName,
    @required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      child: ShadowWidget(
        child: Container(
          height: 150.0,
          width: width,
          decoration: BoxDecoration(
            color: ColorUtil.primaryBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: Stack(
              children: [
                Row(
                  children: [
                    CircleImage(
                      imageUrl: imageUrl,
                      size: 100,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeaderTextWidget(
                            title: journalTitle,
                          ),
                          DescriptionText(
                            text: authorName,
                            fontSize: 12,
                          ),
                          DescriptionText(
                            text: description,
                            fontSize: 10,
                            color: ColorUtil.primarySubTextColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 10.0,
                  child: TagCardWidget(
                    tagText: "NEW",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
