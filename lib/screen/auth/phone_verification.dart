import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/screen/auth/create_password.dart';
import 'package:pinput/pinput.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF2B361C),
              ),
            ),
          ),
        ),
        title: SvgPicture.asset(
          'assets/images/splash/logo.svg',
          height: 54.h,
          width: 52.w,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                // Main content part
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                    ),
                    SizedBox(height: 31.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Text(
                                'We just sent you a SMS',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFD88F48),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Padding(
                            padding: EdgeInsets.only(left: 26.w),
                            child: Text(
                              'Please enter the security code sent to *******483',
                              style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 14.sp,
                                  height: 1.36),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Pinput(
                              length: 6,
                            ),
                          ),
                          SizedBox(height: 29.h),
                          Text(
                            'Resend Code',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Manrope',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 400.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 24.h), // Adjust space at the bottom if needed
                    child: GreenButton(
                      text: 'NEXT',
                      onPressed: () {
                        Get.to(() => CreatePassword());
                      },
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
