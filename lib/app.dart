import 'package:flutter/material.dart';
import 'package:rachinha_top_app/pages/sign_in.dart';
import 'package:rachinha_top_app/pages/sign_up.dart';
import 'package:rachinha_top_app/pages/teams_drawn.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';
import 'package:rachinha_top_app/widgets/app_navigator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (ctx) => const SignInPage(),
        AppRoutes.signUp: (ctx) => const SignUpPage(),
        AppRoutes.index: (ctx) => const AppNavigator(),
        AppRoutes.teams: (ctx) => const TeamsDrawnPage(),
      },
    );
  }
}
