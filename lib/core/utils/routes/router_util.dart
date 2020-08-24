import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

PageTransition pushNamed(
    {Widget page,
    PageTransitionType pageTransitionType,
    RouteSettings settings}) {
  return PageTransition(
    child: page,
    type: pageTransitionType ?? PageTransitionType.fade,
    settings: settings,
  );
}
