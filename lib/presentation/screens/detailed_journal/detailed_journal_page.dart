import 'package:bible_journal/core/utils/color_util.dart';
import 'package:bible_journal/presentation/widgets/buttons/primary_button_widget.dart';
import 'package:bible_journal/presentation/widgets/custom_regular_app_bar_no_scroll.dart';
import 'package:bible_journal/presentation/widgets/mobile_status_margin_top.dart';
import 'package:bible_journal/presentation/widgets/texts/description_text.dart';
import 'package:bible_journal/presentation/widgets/texts/header_text_widget.dart';
import 'package:flutter/material.dart';

class DetailedJournalPage extends StatefulWidget {
  @override
  _DetailedJournalPageState createState() => _DetailedJournalPageState();
}

class _DetailedJournalPageState extends State<DetailedJournalPage> {
  @override
  Widget build(BuildContext context) {
    return MobileStatusMarginTop(
      child: CustomRegularAppBarNoScroll(
        backgroundColor: Colors.transparent,
        hasBackButton: true,
        title: "Bible Journal",
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: ColorUtil.primaryBackgroundColor,
                  leading: Container(),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160,
                            width: 125,
                            decoration: BoxDecoration(
                              color: ColorUtil.primaryBackgroundColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/avatars/lalisa.jpeg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeaderTextWidget(
                                    title: "Lalisa Manoban",
                                  ),
                                  DescriptionText(
                                    text:
                                        "Though chosen, rescued, and promised, God\’s people suffered through severe consequence for their continual rejection of Him and His covenant.",
                                    fontSize: 10,
                                    color: ColorUtil.primarySubTextColor,
                                    hasLimit: true,
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  PrimaryButton(
                                    text: "Add as favourite author",
                                    fontSize: 12,
                                    height: 35,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  expandedHeight: 200.0,
                ),
              ];
            },
            body: Container(),
          ),
        ),
      ),
    );
  }
}
