import 'package:flutter/material.dart';
import 'package:weather_app/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}
