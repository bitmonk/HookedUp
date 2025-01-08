import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/green_button.dart';

Future<dynamic> showClosableConnectionSentPopup({
  required BuildContext context,
  required String title,
  String? content,
  required String buttonText,
  required VoidCallback onPressed,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFFF5F5F5),
      contentPadding: EdgeInsets.fromLTRB(26.w, 19.h, 32.w, 31.h),
      title: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/splash/logo.svg',
                height: 46.h,
                width: 45.w,
              ), // Show icon if path is provided
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 51.h,
                    width: 51.h,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/profile2.png'),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    height: 28.h,
                    width: 28.w,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: const Icon(
                        Icons.add,
                        color: Color(0xFF2B361C),
                        size: 10,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  SizedBox(
                    height: 51.h,
                    width: 51.h,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/profile.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // SizedBox(height: 12.h),
              if (content != null)
                Text(
                  content, // Display content if provided
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF212221).withValues(alpha: 0.6),
                  ),
                ),
              SizedBox(
                height: 14.h,
              ),
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
                  color: const Color(0xFF9FA482).withValues(alpha: 0.42),
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
        text: buttonText,
        onPressed: onPressed,
      ),
    ),
  );
}
