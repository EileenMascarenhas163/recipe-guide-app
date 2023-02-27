import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:demo/login.dart';
import 'package:demo/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        '../assets/images/logo.png',
        width: 395.5,
        height: 650.7,
        fit: BoxFit.cover,
      ),
      duration: 3000,
      nextScreen: Login(),
      backgroundColor: Color(0xFFDF0101),
    );
  }
}
