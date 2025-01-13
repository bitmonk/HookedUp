import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/utils/colors.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 18.w),
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.w),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Help',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFD88F48),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Text(
                            'Have questions or need help? Reach out to us, and our team will get back to you as soon as possible.',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          FormInputField(
                              labelText: 'Subject', obscureText: false),
                          SizedBox(
                            height: 12.h,
                          ),
                          TextField(
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: const Color(0xFF212221),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 243.h, horizontal: 24.w),
                              fillColor: Color(0xFFF5F5F5),
                              filled: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.w, right: 44.w, bottom: 51.h),
              child: SizedBox(
                width: double.infinity,
                child: GreenButton(
                  text: 'SUBMIT',
                  onPressed: () {
                    showClosablePopup(
                        context: context,
                        title: 'Subscription Updated',
                        buttonText: 'OKAY',
                        content:
                            'Your Subscription plan has been updated successfully.',
                        onPressed: () {
                          Get.back();
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
