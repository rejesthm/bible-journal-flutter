import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/core/utils/color_util.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/presentation/widgets/card/feature_card_widget.dart';
import 'package:bible_journal/presentation/widgets/card/index_outline_card_widget.dart';
import 'package:bible_journal/presentation/widgets/custom_regular_app_bar.dart';
import 'package:bible_journal/presentation/widgets/custom_regular_app_bar_no_scroll.dart';
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

  @override
  Widget build(BuildContext context) {
    return MobileStatusMarginTop(
      child: CustomRegularAppBarNoScroll(
        backgroundColor: ColorUtil.primaryBackgroundColor,
        title: "Bible Journal",
        body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                pinned: true,
                backgroundColor: ColorUtil.primaryBackgroundColor,
                leading: Container(),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        children: [
                          FeatureCardWidget(
                            imageUrl: "assets/images/avatars/lalisa.jpeg",
                            journalTitle: "Joy and Strength",
                            authorName: "Lalisa Manoban",
                            description:
                                "The joy of the Lord is found on the road to restoration.",
                          ),
                        ],
                      )),
                ),
                expandedHeight: 230.0,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(10.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: HeaderTextWidget(
                        title: "Bible Outlines",
                        color: ColorUtil.primaryTextColor,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            color: ColorUtil.primaryBackgroundColor,
            child: StreamBuilder<List<Journals>>(
                stream: presenter.journalsController.stream,
                builder: (context, snapshot) {
                  List<Journals> journals = snapshot.data;
                  if (snapshot.hasData) {
                    return ReorderableListView(
                      children: List.generate(
                        journals?.length,
                        (index) {
                          return IndexOutlineCardWidget(
                            key: ValueKey(journals[index].id),
                            imageUrl: journals[index].imageUrl,
                            journalTitle: journals[index].journal.journalTitle,
                            authorName:
                                journals[index].authorProfile.authorName,
                          );
                        },
                      ),
                      onReorder: (int oldIndex, int newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex -= 1;
                          }
                          final Journals item = journals.removeAt(oldIndex);
                          journals.insert(newIndex, item);
                        });
                      },
                    );
                  }
                  return CupertinoActivityIndicator();
                }),
          ),
        ),
      ),
    );
  }

  // void _updateMyItems(int oldIndex, int newIndex) {
  //   if (newIndex > oldIndex) {
  //     newIndex -= 1;
  //   }

  //   final Journals item = journals.removeAt(oldIndex);

  //   journals.insert(newIndex, item);
  // }
}
