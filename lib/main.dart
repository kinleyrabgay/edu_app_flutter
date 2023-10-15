import 'package:edu_app/core/res/colours.dart';
import 'package:edu_app/core/res/fonts.dart';
import 'package:edu_app/core/services/injection_container.dart';
import 'package:edu_app/core/services/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Education App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Theming
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        fontFamily: Fonts.poppins,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
      ),
      // routes: {
      //   OnboardingScreen.routeName: (_) => const OnboardingScreen(),
      // },
      onGenerateRoute: generateRoute,
    );
  }
}
