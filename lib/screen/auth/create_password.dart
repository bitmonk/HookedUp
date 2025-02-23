import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/controllers/auth_controller.dart';
import 'package:hooked_up/screen/auth/get_notified.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final authController = Get.find<AuthController>();
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                    ),
                    SizedBox(height: 31.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Create your Password',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFD88F48),
                              ),
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 14,
                                color: Color(0xFF212221),
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Choose a password with at least',
                                ),
                                TextSpan(
                                  text: ' 8 characters,',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(text: ' containing'),
                                TextSpan(
                                  text: ' a letter',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(text: ' and'),
                                TextSpan(
                                  text: ' a number.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          FormInputField(
                              onChanged: (value) {
                                authController.password.value = value.trim();
                                print(
                                    'Updated Password: ${authController.password.value}');
                              },
                              labelText: 'Password',
                              obscureText: true),
                          SizedBox(
                            height: 12.h,
                          ),
                          const FormInputField(
                              labelText: 'Confirm Password', obscureText: true),
                          SizedBox(
                            height: 380.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: GreenButton(
                      text: 'NEXT',
                      onPressed: () {
                        // authController.registerUser();
                        Get.to(() => GetNotified());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
