import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/pages/login_page.dart';
import 'package:movie_app/features/auth/presentation/pages/signin_page.dart';
import 'package:movie_app/splash_screen.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignInPage.routeName: (context) => const SignInPage(),
      },
    );
  }
}
