import 'package:flutter/material.dart';

class ExplainerScreen extends StatefulWidget {
  const ExplainerScreen({super.key});

  @override
  State<ExplainerScreen> createState() => _ExplainerScreenState();
}

class _ExplainerScreenState extends State<ExplainerScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(9, 16, 24, 1),
        child: Stack(
          children: [
            Positioned(
              bottom: screenSize.height * 0.25,
              left: -screenSize.width * 0.05,
              child: Image.asset(
                'assets/images/explainer/asdf.png',
                height: screenSize.height * 1.1,
                width: screenSize.width * 1.2,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenSize.height * 0.09),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    screenSize.width * 0.05,
                    screenSize.height * 0.03,
                    screenSize.width * 0.05,
                    screenSize.height * 0.03,
                  ),
                  width: screenSize.width * 0.9,
                  height: screenSize.height * 0.4,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(9, 16, 24, 1),
                    border: Border.all(
                      color: const Color(0xFF697B89),
                    ),
                    borderRadius:
                        BorderRadius.circular(screenSize.width * 0.05),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explainer Title - Lorem Ipsumdolor sit amet.',
                        style: TextStyle(
                          color: const Color(0xFFD88F48),
                          fontFamily: 'Manrope',
                          fontSize: screenSize.width * 0.045,
                          fontWeight: FontWeight.w700,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                      SizedBox(height: screenSize.height * 0.03),
                      Text(
                        'This is a longer description that will provide more details about the content of the explainer. It will wrap inside the container if it is too long.',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Manrope',
                          fontSize: screenSize.width * 0.035,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
