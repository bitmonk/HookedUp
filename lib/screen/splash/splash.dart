import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/screen/explainer/explainer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ExplainerScreen()),
      );
    });
    return Scaffold(
      body: Container(
        color: const Color(0xFF2B361C),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/splash/logo.svg',
                height: screenSize.height * 0.25,
                width: screenSize.width * 0.5,
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text(
                'Hooked Up',
                style: TextStyle(
                  fontFamily: 'Chronograph',
                  color: const Color(0xFFD88F48),
                  fontSize: screenSize.width * 0.15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
