import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gemini_tut_app/ui/splash/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashState.navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/logos/splash_logo.png',
              width: 116,
            ),
          ),
          Align(
            alignment: Alignment(0, 0.7),
            child: Container(
              width: 60,
              height: 60,
              child: const SpinKitPulse(
                color: Colors.grey,
                size: 52,
              ),
            ),
          )
        ],
      ),
    );
  }
}
