import 'package:edu_app/core/common/views/page_under_construction.dart';
import 'package:edu_app/src/on_boarding/presentation/on_boarding_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // If the name of the route
  switch (routeSettings.name) {
    case OnboardingScreen.routeName:
      return _pageRouteBuilder(
        (_) => const OnboardingScreen(),
        routeSettings: routeSettings,
      );

    default:
      return _pageRouteBuilder(
        (_) => const PageUnderConstruction(),
        routeSettings: routeSettings,
      );
  }
}

// Cutome
PageRouteBuilder<dynamic> _pageRouteBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings routeSettings,
}) {
  return PageRouteBuilder(
    settings: routeSettings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
