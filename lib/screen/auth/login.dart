import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/screen/auth/create_account.dart';
import 'package:hooked_up/screen/auth/forgot_pass.dart';
import 'package:hooked_up/screen/home/home_social_feed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUserWithEmailAndPassword() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        // Navigate to the home feed only if the user is authenticated
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeSocialFeed(),
          ),
        );
      }
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 45.w,
            ), // Responsive padding
            child: Column(
              children: [
                SizedBox(height: 100.h), // Responsive vertical spacing
                SvgPicture.asset(
                  'assets/images/splash/logo.svg',
                  height: 141.h, // Adjusted logo size
                  width: 145.w,
                ),
                SizedBox(
                  height: keyboardVisible ? 10.h : 27.h,
                ),
                Text(
                  'Hooked Up',
                  style: TextStyle(
                    fontFamily: 'Chronograph',
                    color: const Color(0xFFD88F48),
                    fontSize: 45.sp, // Responsive font size
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: keyboardVisible ? 10.h : 61.h,
                ),
                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 16.sp), // Responsive label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 18.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible ? 10.h : 12.h,
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(fontSize: 16.sp), // Responsive label
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 18.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible ? 10.h : 42.h,
                ),
                SizedBox(
                    width: double.infinity,
                    child: GreenButton(
                      text: 'CONFIRM',
                      onPressed: () async {
                        await loginUserWithEmailAndPassword();
                      },
                    )),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPass(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 60.h), // Adjusted spacing
                Text(
                  'Still don\'t have an account?',
                  style: TextStyle(fontSize: 14.sp), // Responsive text
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFD88F48),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccount(),
                        ),
                      );
                    },
                    child: Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(
                        color: const Color(0xFFF3FAFE),
                        fontSize: 22.sp, // Responsive font size
                        fontWeight: FontWeight.w700,
                      ),
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
