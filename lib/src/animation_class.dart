import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}



mixin Teleport {
  static void push({
    required BuildContext context,
    required PageRouteBuilder<dynamic> animationsType,
  }) =>
      Future<void>.microtask(() {
        Navigator.of(context).push(
          animationsType,
        );
      });

////By using the refactored pushReplacementNamed method with the PageRouteBuilder,
// you retain the ability to pass data between screens in the same way
// as the original Navigator.pushNamed method. so don't worry

  static void pushReplacementNamed({
    required BuildContext context,
    required PageRouteBuilder<dynamic> animationType,
    dynamic arguments,
  }) {
    Future<void>.microtask(() {
      final currentRoute = ModalRoute.of(context);
      if (currentRoute != null) {
        Navigator.pushReplacement(
          context,
          CustomPageRoute<dynamic>(
            animationType: animationType,
            arguments: arguments,
          ),
        );
      }
    });
  }

////when you call pushNamed and pass the arguments, they will be set using
// ModalRoute.of(context)?.settings.arguments. Now you can access the arguments
// using ModalRoute.of(context)!.settings.arguments within the destination screen.

  static void pushNamed({
    required BuildContext context,
    required PageRouteBuilder<dynamic> animationType,
    dynamic arguments,
  }) {
    Future<void>.microtask(() {
      Navigator.push(
        context,
        CustomPageRoute(
          animationType: animationType,
          arguments: arguments,
        ),
      );
    });
  }

  static void pop(BuildContext context, {dynamic result}) =>
      Future<void>.microtask(() {
        Navigator.pop(context, result);
      });

  static void popUntil(BuildContext context, {required String routeName}) =>
      Future<void>.microtask(() {
        Navigator.popUntil(context, ModalRoute.withName(routeName));
      });

  ////By using the refactored pushNamedAndRemoveUntil method with the PageRouteBuilder,
// you retain the ability to pass data between screens in the same way
// as the original Navigator.pushNamedAndRemoveUntil method. so don't worry
  static void pushNamedAndRemoveUntil({
    required BuildContext context,
    required bool Function(Route<dynamic>) predicate,
    required PageRouteBuilder<dynamic> animationType,
    dynamic arguments,
  }) {
    Future<void>.microtask(() {
      Navigator.pushAndRemoveUntil(
        context,
        CustomPageRoute(
          animationType: animationType,
          arguments: arguments,
        ),
            (route) => predicate(route),
      );
    });
  }
}

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final PageRouteBuilder<dynamic> animationType;
  final dynamic arguments;

  CustomPageRoute({
    required this.animationType,
    this.arguments,
  }) : super(
    pageBuilder: animationType.pageBuilder,
    transitionsBuilder: animationType.transitionsBuilder,
    settings: RouteSettings(arguments: arguments),
    transitionDuration: animationType.transitionDuration,
    reverseTransitionDuration: animationType.reverseTransitionDuration,
  );

  @override
  RouteSettings get settings => RouteSettings(arguments: arguments);
}