import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/utils/colors.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Frequently Asked Questions',
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFFD88F48),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 11.h,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 341.w,
                          child: FormInputField(
                              labelText: 'Search', obscureText: false),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
