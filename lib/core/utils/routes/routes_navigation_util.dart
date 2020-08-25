import 'package:bible_journal/presentation/screens/detailed_journal/detailed_journal_page.dart';
import 'package:bible_journal/presentation/screens/errors/not_found_page.dart';
import 'package:bible_journal/presentation/screens/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'router_util.dart';
import 'routes_list.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HOME_ROUTE:
      return pushNamed(page: HomePage(), settings: settings);
      break;
    case DETAILED_JOURNAL_ROUTE:
      return pushNamed(page: DetailedJournalPage(), settings: settings);
      break;
    default:
      return _errorRoute(settings);
      break;
  }
}

Route<dynamic> _errorRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) => NotFoundPage(
      name: settings.name,
    ),
  );
}
