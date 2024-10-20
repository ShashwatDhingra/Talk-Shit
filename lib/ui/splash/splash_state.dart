import 'package:flutter/material.dart';
import 'package:gemini_tut_app/ui/home/home_screen.dart';

class SplashState {
  static Future<void> navigateToHome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
