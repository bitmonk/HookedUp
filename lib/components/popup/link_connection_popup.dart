import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/utils/colors.dart';

Future<dynamic> showLinkConnectionPopup({
  required BuildContext context,
  required String title,
  String? content,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFFFFFFFC),
      // contentPadding: EdgeInsets.fromLTRB(26.w, 19.h, 32.w, 31.h),
      title: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Link Connection',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.heading,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 51.h,
                    width: 51.w,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/profile.png'),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Container(
                    height: 26.h,
                    width: 26.w,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: const Icon(
                        Icons.add_rounded,
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
                    width: 51.w,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/profile2.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'From:',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xFF212221).withAlpha(60),
                    ),
                  ),
                  SizedBox(
                    width: 11.w,
                  ),
                  SizedBox(
                    height: 29.h,
                    width: 29.w,
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/profile2.png'),
                    ),
                  ),
                  SizedBox(
                    width: 11.w,
                  ),
                  Text(
                    'Sarah Smith',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xFF212221).withAlpha(60),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 18.h, 16.w, 18.h),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud. \n \n Lorem ipsum dolor sit amet. consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud', // Display content if provided
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF212221).withValues(alpha: 0.6),
                    ),
                  ),
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
    ),
  );
}
