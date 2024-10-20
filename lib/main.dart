import 'package:flutter/material.dart';
import 'package:gemini_tut_app/ui/home/home_screen.dart';
import 'package:gemini_tut_app/ui/home/home_provider.dart';
import 'package:gemini_tut_app/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => HomeProvider())],
      child: MaterialApp(
          title: 'Talk Sh!t',
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(),
          home: const SplashScreen()),
    );
  }
}
