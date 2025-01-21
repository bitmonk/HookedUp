import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/utils/colors.dart';

Future<dynamic> showClosablePopup({
  required BuildContext context,
  required String title,
  String? content,
  required String buttonText,
  required VoidCallback onPressed,
  bool? showExtraOption,
  VoidCallback? closeBtnRoute,
}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: Color(0xFFF5F5F5),
      contentPadding: EdgeInsets.fromLTRB(26.w, 34.h, 32.w, 31.h),
      title: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/splash/logo.svg',
                  height: 46.h,
                  width: 45.w,
                ),
                SizedBox(height: 24.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 12.h),
                if (content != null)
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF212221).withAlpha(153),
                    ),
                  ),
                // SizedBox(height: 14.h),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                if (closeBtnRoute != null) {
                  closeBtnRoute();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF9FA482).withAlpha(107),
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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: GreenButton(
              text: buttonText,
              onPressed: onPressed,
            ),
          ),
          if (showExtraOption == true) // Conditionally render extra option
            Container(
              margin: EdgeInsets.only(top: 10.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF2B361C),
                    width: 0.5.w,
                  ),
                ),
              ),
              child: Text(
                'Delete Account',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.thickGreen,
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
