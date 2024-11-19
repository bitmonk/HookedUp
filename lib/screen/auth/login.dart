import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      resizeToAvoidBottomInset:
          true, // Ensures the UI resizes when the keyboard is shown
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.12),
                  child: SvgPicture.asset(
                    'assets/images/splash/logo.svg',
                    height: screenSize.height * 0.20,
                    width: screenSize.width * 0.5,
                  ),
                ),
                // Spacer to avoid overlapping with the keyboard
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.02
                      : screenSize.height * 0.05,
                ),

                // App name text
                Text(
                  'Hooked Up',
                  style: TextStyle(
                    fontFamily: 'Chronograph',
                    color: const Color(0xFFD88F48),
                    fontSize: screenSize.width * 0.12,
                  ),
                ),
                // Spacer to avoid overlapping with the keyboard
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.02
                      : screenSize.height * 0.05,
                ),

                // Email input field
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                  ),
                ),
                // Spacer between input fields
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.02
                      : screenSize.height * 0.01,
                ),

                // Password input field with obscure text
                TextField(
                  obscureText: _isPasswordObscured,
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
                // Spacer between input fields and the login button
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.02
                      : screenSize.height * 0.04,
                ),

                // Full-width Login button
                SizedBox(
                  width: double
                      .infinity, // Makes the button take the full width of the container
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF606C38), // Button background color
                      padding:
                          const EdgeInsets.symmetric(vertical: 18.0), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            20), // Border radius for rounded corners
                      ),
                    ),
                    onPressed: () {
                      // Action on button press
                    },
                    child: const Text(
                      'LOG IN',
                      style: TextStyle(color: Color(0xFFF3FAFE)),
                    ),
                  ),
                ),

                SizedBox(height: screenSize.height * 0),

                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(decoration: TextDecoration.underline),
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
