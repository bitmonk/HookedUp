import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/screen/auth/forgot_pass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.08), // Adjusted padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.10),
                  child: SvgPicture.asset(
                    'assets/images/splash/logo.svg',
                    height: screenSize.height * 0.15, // Adjusted size for logo
                    width: screenSize.width * 0.25, // Adjusted size for logo
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
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintStyle: const TextStyle(
                      fontSize: 12, // Adjusted font size
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 18),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.02
                      : screenSize.height * 0.01,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
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
                      ? screenSize.height * 0.02
                      : screenSize.height * 0.04,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFF606C38),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                          color: const Color(0xFFF3FAFE),
                          fontSize: screenSize.width * 0.05,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPass(),
                      ),
                    );
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.07,
                ),
                const Text(
                  'Still don\'t have an account?',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFD88F48),
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(
                          color: const Color(0xFFF3FAFE),
                          fontSize:
                              screenSize.width * 0.05, // Adjusted font size
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
