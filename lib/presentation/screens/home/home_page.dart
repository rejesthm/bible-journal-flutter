import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/core/utils/color_util.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/presentation/widgets/card/feature_card_widget.dart';
import 'package:bible_journal/presentation/widgets/card/index_outline_card_widget.dart';
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
    List<Journals> journals;
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
                      child: StreamBuilder<List<Journals>>(
                          initialData: [],
                          stream: presenter.journalsController.stream,
                          builder: (context, snapshot) {
                            journals = snapshot.data;
                            if (journals.length != 0) {
                              return Column(
                                children: [
                                  FeatureCardWidget(
                                    journal: journals[0],
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          })),
                ),
                expandedHeight: 230.0,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(5.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: HeaderTextWidget(
                        title: "Journals",
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
            color: ColorUtil.primaryBackgroundColor,
            child: StreamBuilder<List<Journals>>(
                stream: presenter.journalsController.stream,
                builder: (context, snapshot) {
                  journals = snapshot.data;
                  if (snapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ReorderableListView(
                        children: List.generate(
                          journals?.length,
                          (index) {
                            return IndexOutlineCardWidget(
                              key: ValueKey(journals[index].id),
                              journal: journals[index],
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
                      ),
                    );
                  }
                  return CupertinoActivityIndicator();
                }),
          ),
        ),
      ),
    );
  }
}
