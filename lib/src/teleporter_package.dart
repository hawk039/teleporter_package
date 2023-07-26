library teleporter;

import 'package:flutter/material.dart';
import 'package:teleporter_package/src/path_generator.dart';



class TeleportationAnimations {
  _returnRout(String routName) {
    Widget? widgetForAnimation = GenerateRoutePaths.generateRoute(
      RouteSettings(name: routName),
    );
    return widgetForAnimation;
  }

  /////////fading page teleportation///////////
  PageRouteBuilder<dynamic> fadeNavigationTeleportation({
    required Duration transitionTimeDuration,
    required Duration reverseTransitionTimeDuration,
    required String route,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return _returnRout(
          route,
        ); // Make sure _returnRout() returns a valid widget
      },
      transitionDuration: transitionTimeDuration,
      reverseTransitionDuration: reverseTransitionTimeDuration,
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn,
        );
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

///////////new  screen slide from right side /////////
  PageRouteBuilder<dynamic> rightSliderTransitionTeleportation({
    required Duration transitionTimeDuration,
    required Duration reverseTransitionTimeDuration,
    required String route,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return _returnRout(
            route); // Make sure _returnRout() returns a valid widget
      },
      transitionDuration: transitionTimeDuration,
      reverseTransitionDuration: reverseTransitionTimeDuration,
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn,
        );
        return SlideTransition(
          position: Tween(
            begin: const Offset(1.0, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}