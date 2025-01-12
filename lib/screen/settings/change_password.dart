import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/home/heading_text_orange.dart';
import 'package:hooked_up/screen/settings/new_password.dart';
import 'package:hooked_up/utils/colors.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: const Color(0xFFFFFFFC),
        backgroundColor: const Color(0xFFFFFFFC),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
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
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 44.w),
              child: Row(
                children: [
                  HeadTextOrange(title: 'Change your Password'),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 12.h, left: 45.w, right: 44.w),
                    child: Column(
                      children: [
                        Text(
                            'Please provide your email so we can send a link to reset your password.  '),
                        SizedBox(
                          height: 12.h,
                        ),
                        FormInputField(labelText: 'Email', obscureText: false),
                        SizedBox(
                          height: 12.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 42.h, left: 45.w, right: 44.w),
              child: SizedBox(
                width: double.infinity,
                child: GreenButton(
                    text: 'CONFIRM',
                    onPressed: () {
                      Get.to(() => NewPassword());
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
