import 'package:bible_journal/presentation/screens/errors/not_found_page.dart';
import 'package:bible_journal/presentation/screens/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'router_util.dart';
import 'routes_list.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case HOME_ROUTE:
      return pushNamed(page: HomePage(), settings: settings);
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
