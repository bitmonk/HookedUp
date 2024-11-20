import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/screen/auth/reset_pass.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF9FA482).withOpacity(0.42),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFF2B361C),
            ),
          ),
        ),
      ),
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
                      'Forgot your password?',
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
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Please provide your email so we can send a link to reset your password.',
                    style: TextStyle(
                      fontSize: screenSize.height * 0.015,
                    ),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible
                      ? screenSize.height * 0.01
                      : screenSize.height * 0.013,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintStyle: const TextStyle(
                      fontSize: 10,
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
                  height: screenSize.height * 0.2,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPass(),
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
