import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
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
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 45.w,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 100.h),
                    SvgPicture.asset(
                      'assets/images/splash/logo.svg',
                      height: 141.h,
                      width: 145.w,
                    ),
                    SizedBox(
                      height: 27.h,
                    ),
                    Text(
                      'Hooked Up',
                      style: TextStyle(
                        fontFamily: 'Chronograph',
                        color: const Color(0xFFD88F48),
                        fontSize: 45.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 61.h,
                    ),
                    FormInputField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      validator: ValidationBuilder().email().build(),
                      labelText: 'Email',
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    FormInputField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      validator: ValidationBuilder().build(),
                      labelText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 42.h,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: GreenButton(
                          text: 'CONFIRM',
                          onPressed: () async {
                            // Unfocus the text fields before navigating
                            _emailFocusNode.unfocus();
                            _passwordFocusNode.unfocus();
                            // Proceed to the next page
                            Get.to(() => HomeSocialFeed());
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
                    SizedBox(height: 60.h),
                    Text(
                      'Still don\'t have an account?',
                      style: TextStyle(fontSize: 14.sp),
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
                          Get.to(() => CreateAccount());
                        },
                        child: Text(
                          'CREATE ACCOUNT',
                          style: TextStyle(
                            color: const Color(0xFFF3FAFE),
                            fontSize: 22.sp,
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
        ),
      ),
    );
  }
}
