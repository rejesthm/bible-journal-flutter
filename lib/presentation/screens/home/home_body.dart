import 'package:bible_journal/core/utils/color_util.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/presentation/bloc/home/home_bloc.dart';
import 'package:bible_journal/presentation/widgets/card/feature_card_widget.dart';
import 'package:bible_journal/presentation/widgets/card/index_outline_card_widget.dart';
import 'package:bible_journal/presentation/widgets/custom_regular_app_bar_no_scroll.dart';
import 'package:bible_journal/presentation/widgets/mobile_status_margin_top.dart';
import 'package:bible_journal/presentation/widgets/texts/header_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  void _onLoad() async {
    BlocProvider.of<HomeBloc>(context).add(
      LoadJournals(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MobileStatusMarginTop(
      child: CustomRegularAppBarNoScroll(
        backgroundColor: ColorUtil.primaryBackgroundColor,
        title: "Bible Journal",
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              _onLoad();
            }

            if (state is JournalsLoadingSuccess) {
              List<Journals> journals = state.journals;

              return NestedScrollView(
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
                                state is JournalsLoading
                                    ? CupertinoActivityIndicator
                                    : FeatureCardWidget(
                                        journal: journals[0],
                                      ),
                              ],
                            )),
                      ),
                      expandedHeight: 220.0,
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
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: state is JournalsLoading
                        ? CupertinoActivityIndicator
                        : ReorderableListView(
                            children: List.generate(
                              journals?.length,
                              (index) {
                                if (index == 0) {
                                  return Container(
                                    key: ValueKey(journals[index].id),
                                  );
                                }
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
                                final Journals item =
                                    journals.removeAt(oldIndex);
                                journals.insert(newIndex, item);
                              });
                            },
                          ),
                  ),
                ),
              );
            }

            return Container(
              child: CupertinoActivityIndicator(),
            );
          },
        ),
      ),
    );
  }
}
