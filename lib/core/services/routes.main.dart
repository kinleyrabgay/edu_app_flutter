part of 'routes.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  // If the name of the route
  // Check if usere is first timer => onboarding && home
  switch (routeSettings.name) {
    case '/':
      final prefs = sl<SharedPreferences>();
      return _pageRouteBuilder(
        (context) {
          if (prefs.getBool(kFirstTimerKey) ?? true) {
            return BlocProvider(
              create: (_) => sl<OnBoardCubit>(),
              child: const OnboardingScreen(),
            );
          } else if (sl<FirebaseAuth>().currentUser != null) {
            final user = sl<FirebaseAuth>().currentUser!;
            final localUser = LocalUserModel(
              uid: user.uid,
              email: user.email ?? '',
              points: 0,
              fullName: user.displayName ?? '',
            );
            context.userProvider.initUser(localUser);
            return const DashboardScreen();
          }
          return BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const SignInScreen(),
          );
        },
        routeSettings: routeSettings,
      );

    case SignInScreen.routeName:
      return _pageRouteBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignInScreen(),
        ),
        routeSettings: routeSettings,
      );
    case SignUpScreen.routeName:
      return _pageRouteBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignUpScreen(),
        ),
        routeSettings: routeSettings,
      );
    case DashboardScreen.routeName:
      return _pageRouteBuilder(
        (_) => const DashboardScreen(),
        routeSettings: routeSettings,
      );

    case '/forgot-password':
      return _pageRouteBuilder(
        (_) => const fui.ForgotPasswordScreen(),
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
