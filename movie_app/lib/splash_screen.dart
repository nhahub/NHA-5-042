// splash_screen.dart
import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/pages/login_page.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/Cinematic Vignette & Ambient Background Layers.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Positioned(
            top: 225,
            left: 25,
            right: 25,
            child: Center(
              child: Image.asset(
                'assets/images/Purple Ambient Center Glow.png',
                width: 340,
                height: 340,
              ),
            ),
          ),
          Positioned(
            top: 225,
            left: 25,
            right: 25,
            child: Center(
              child: Image.asset(
                'assets/logos/Logo Container with Neon Glow Backplate_margin.png',
                width: 340,
                height: 340,
              ),
            ),
          ),
          Positioned(
            top: 320,
            left: 25,
            right: 25,
            child: Center(
              child: Image.asset(
                'assets/icons/Heading 1 - App Title_margin.png',
                width: 340,
                height: 340,
              ),
            ),
          ),
          Positioned(
            top: 350,
            left: 25,
            right: 25,
            child: Center(
              child: Image.asset(
                'assets/icons/Text.png',
                width: 340,
                height: 340,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
