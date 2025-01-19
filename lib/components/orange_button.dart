import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/utils/colors.dart';

class OrangeButton extends StatelessWidget {
  String buttonTitle;
  bool requestSent;
  VoidCallback onTap;

  OrangeButton({
    super.key,
    required this.buttonTitle,
    required this.requestSent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 26.h,
        width: 86.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            width: 1,
            color: AppColors.heading,
          ),
          color: requestSent ? Colors.transparent : Color(0xFFD88F48),
        ),
        child: Center(
          child: Text(
            requestSent ? 'Request Sent' : buttonTitle,
            style: TextStyle(
              color: requestSent ? AppColors.heading : Color(0xFFF5F5F5),
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
