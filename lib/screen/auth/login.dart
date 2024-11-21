import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/screen/auth/create_account.dart';
import 'package:hooked_up/screen/auth/forgot_pass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateAccount(),
                          ),
                        );
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
                    onPressed: () {},
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
