import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/green_button.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                SvgPicture.asset(
                  'assets/images/splash/logo.svg',
                  height: 141.h,
                  width: 145.w,
                ),
                SizedBox(
                  height: keyboardVisible ? 5.h : 27.h,
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
                  height: keyboardVisible ? 50.h : 150.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Reset your password',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible ? 10.h : 12.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 60.w),
                  child: Text(
                    'Please select your new password.',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: keyboardVisible ? 10.h : 12.h,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF212221),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 27.w,
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
                    hintText: 'Confirm New Password',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF212221),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 27.w,
                      vertical: 18.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GreenButton(
                    text: 'CONFIRM',
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          contentPadding:
                              EdgeInsets.fromLTRB(26.w, 19.h, 32.w, 31.h),
                          title: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/splash/logo.svg',
                                    height: 46.h,
                                    width: 45.w,
                                  ),
                                  SizedBox(height: 24.h),
                                  Text(
                                    'Password Changed Successfully',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
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
                                    padding: EdgeInsets.all(8.w),
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
                          content: GreenButton(
                            text: 'OKAY',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    },
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