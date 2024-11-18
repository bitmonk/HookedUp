import 'package:flutter/material.dart';
import 'package:hooked_up/screen/explainer/explainer.dart';
// import 'package:hooked_up/screen/splash/splash.dart';
// import 'package:hooked_up/screen/explainer/explainer.dart';
// import 'package:hooked_up/screen/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExplainerScreen(),
    );
  }
}
