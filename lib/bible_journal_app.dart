import 'package:flutter/material.dart';

import 'core/utils/color_util.dart';
import 'presentation/screens/errors/not_found_page.dart';
import 'presentation/screens/home/home_page.dart';
import 'core/utils/routes/routes_navigation_util.dart' as routes;

class BibleJournalApp extends StatefulWidget {
  @override
  _BibleJournalAppState createState() => _BibleJournalAppState();
}

class _BibleJournalAppState extends State<BibleJournalApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          headline5: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 14,
          ),
          subtitle1: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 12,
          ),
          subtitle2: TextStyle(
            color: ColorUtil.primaryTextColor,
            fontFamily: "Montserrat",
            fontSize: 13,
          ),
          bodyText1: TextStyle(
            color: ColorUtil.primaryTextColor,
            fontFamily: "Montserrat",
            fontSize: 10,
          ),
          bodyText2: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 11,
          ),
          button: TextStyle(
            fontFamily: "Montserrat",
          ),
          headline4: TextStyle(
            color: ColorUtil.primaryTextColor,
            fontSize: 9,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat",
          ),
          headline3: TextStyle(
            color: ColorUtil.primaryTextColor,
            fontSize: 9,
            fontWeight: FontWeight.w500,
            fontFamily: "Montserrat",
          ),
        ),
      ),
      home: HomePage(),
      onGenerateRoute: routes.generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => NotFoundPage(name: settings.name)),
    );
  }
}
