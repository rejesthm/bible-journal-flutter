import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/core/utils/color_util.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/presentation/widgets/card/feature_card_widget.dart';
import 'package:bible_journal/presentation/widgets/card/index_outline_card_widget.dart';
import 'package:bible_journal/presentation/widgets/custom_regular_app_bar.dart';
import 'package:bible_journal/presentation/widgets/mobile_status_margin_top.dart';
import 'package:bible_journal/presentation/widgets/texts/header_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_presenter.dart';

class HomePage extends BibleJournalPage {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BibleJournalPageState<HomePresenter> {
  @override
  HomePresenter createPresenter() {
    return HomePresenter(this);
  }

  List<Journals> journals;
  @override
  Widget build(BuildContext context) {
    return MobileStatusMarginTop(
      child: CustomRegularAppBar(
        backgroundColor: Colors.transparent,
        title: "Bible Journal",
        body: StreamBuilder<List<Journals>>(
            stream: presenter.journalsController.stream,
            builder: (context, snapshot) {
              journals = snapshot.data;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CupertinoActivityIndicator());
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeatureCardWidget(
                    imageUrl: "assets/images/avatars/lalisa.jpeg",
                    journalTitle: "Joy and Strength",
                    authorName: "Lalisa Manoban",
                    description:
                        "The joy of the Lord is found on the road to restoration.",
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: HeaderTextWidget(
                      title: "Bible Outlines",
                      color: ColorUtil.primaryTextColor,
                      fontSize: 22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ReorderableListView(
                      children: List.generate(
                        journals.length,
                        (index) {
                          return IndexOutlineCardWidget(
                            imageUrl: journals[index].imageUrl,
                            journalTitle: journals[index].journal.journalTitle,
                            authorName:
                                journals[index].authorProfile.authorName,
                          );
                        },
                      ),
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          _updateMyItems(oldIndex, newIndex);
                        });
                      },
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }

  void _updateMyItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final Journals item = journals.removeAt(oldIndex);

    journals.insert(newIndex, item);
  }
}
