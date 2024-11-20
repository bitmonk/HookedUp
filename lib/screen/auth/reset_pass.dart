import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.07),
                  child: SvgPicture.asset(
                    'assets/images/splash/logo.svg',
                    height: screenSize.height * 0.150,
                    width: screenSize.width * 0.145,
                  ),
                ),
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.02
                      : screenSize.height * 0.03,
                ),
                Text(
                  'Hooked Up',
                  style: TextStyle(
                    fontFamily: 'Chronograph',
                    color: const Color(0xFFD88F48),
                    fontSize: screenSize.width * 0.08,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.02
                      : screenSize.height * 0.05,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Reset your password',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.01
                      : screenSize.height * 0.014,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Please select your new password.',
                      style: TextStyle(
                        fontSize: screenSize.height * 0.015,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.01
                      : screenSize.height * 0.013,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF212221),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.01
                      : screenSize.height * 0.013,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm New Password',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF212221),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                  ),
                ),
                SizedBox(
                  height: screenSize.width * 0.3,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF606C38),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          contentPadding: const EdgeInsets.all(23),
                          title: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/splash/logo.svg',
                                    height: 46,
                                    width: 45,
                                  ),
                                  const SizedBox(height: 30),
                                  const Text(
                                    'Password Changed Successfully',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF9FA482)
                                          .withOpacity(0.42),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      color: Color(0xFF2B361C),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          content: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: const Color(0xFF606C38),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'OKAY',
                              style: TextStyle(
                                fontSize: screenSize.height * 0.025,
                                color: const Color(0xFFF3FAFE),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'CONFIRM',
                      style: TextStyle(
                          color: Color(0xFFF3FAFE),
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
