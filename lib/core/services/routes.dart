import 'package:edu_app/core/common/views/page_under_construction.dart';
import 'package:edu_app/core/services/injection_container.dart';
import 'package:edu_app/src/on_boarding/data/datasource/on_boarding_local_datasource.dart';
import 'package:edu_app/src/on_boarding/presentation/cubit/on_board_cubit.dart';
import 'package:edu_app/src/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // If the name of the route
  // Check if usere is first timer => onboarding && home
  switch (routeSettings.name) {
    case '/':
      final prefs = sl<SharedPreferences>();
      return _pageRouteBuilder(
        (_) {
          if(prefs.getBool(kFirstTimerKey) ?? true) {
          BlocProvider(
          create: (_) => sl<OnBoardCubit>(),
          child: const OnboardingScreen(),
        );
          } else if(sl<FirebaseAuth>().currentUser != null) {
            final user = sl<FirebaseAuth>().currentUser!;
            final localUser 
          }
        },
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
