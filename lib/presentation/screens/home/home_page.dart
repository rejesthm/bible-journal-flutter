import 'package:bible_journal/presentation/widgets/card/feature_card_widget.dart';
import 'package:bible_journal/presentation/widgets/card/index_outline_card_widget.dart';
import 'package:bible_journal/presentation/widgets/custom_regular_app_bar.dart';
import 'package:bible_journal/presentation/widgets/mobile_status_margin_top.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MobileStatusMarginTop(
      child: CustomRegularAppBar(
        backgroundColor: Colors.transparent,
        title: "Bible Journal",
        body: Container(
          child: Column(
            children: [
              FeatureCardWidget(
                imageUrl: "assets/images/avatars/lalisa.jpeg",
                journalTitle: "Joy and Strength",
                authorName: "Lalisa Manoban",
                description:
                    "The joy of the Lord is found on the road to restoration.",
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    IndexOutlineCardWidget(
                      imageUrl: "assets/images/avatars/lalisa.jpeg",
                      journalTitle: "Joy and Strength",
                      authorName: "Lalisa Manoban",
                    ),
                    IndexOutlineCardWidget(
                      imageUrl: "assets/images/avatars/lalisa.jpeg",
                      journalTitle: "Joy and Strength",
                      authorName: "Lalisa Manoban",
                    ),
                    IndexOutlineCardWidget(
                      imageUrl: "assets/images/avatars/lalisa.jpeg",
                      journalTitle: "Joy and Strength",
                      authorName: "Lalisa Manoban",
                    ),
                    IndexOutlineCardWidget(
                      imageUrl: "assets/images/avatars/lalisa.jpeg",
                      journalTitle: "Joy and Strength",
                      authorName: "Lalisa Manoban",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
