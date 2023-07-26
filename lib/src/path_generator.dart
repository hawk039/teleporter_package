import 'package:flutter/material.dart';


abstract class Routes {
  static const String splashScreen = '/splashScreen';
  static const String journalScreen = '/journalScreen';
  static const String carousel = '/carousel_screen';
  static const String loginScreen = '/loginScreen';
  static const String addTextScreen = '/addTextScreen';
}

abstract class GenerateRoutePaths {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
  GlobalKey<ScaffoldMessengerState>();

  static Widget? generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;

    switch (routeName) {
    // your prefer  widget switch case here  for example example
    // case Routes.journalScreen:
    // return const JournalScreen();
    }
    return null;
  }
}
