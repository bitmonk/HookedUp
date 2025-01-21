import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/utils/colors.dart';

Future<dynamic> requestJoinPopup({
  required BuildContext context,
  required String title,
  final VoidCallback? onPressed,
  String? content,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: const Color(0xFFFFFFFC),
      contentPadding: EdgeInsets.fromLTRB(26.w, 19.h, 32.w, 31.h),
      title: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 11.w,
                  ),
                  Text(
                    'Send request to:',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xFF212221).withAlpha(60),
                      fontWeight: FontWeight.w500,
                    ),
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
                    width: 6.w,
                  ),
                  Text(
                    'Sarah Smith',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xFF212221),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Container(
                height: 116.h,
                width: 295.w,
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add Note',
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child: GreenButton(
                  text: 'SEND',
                  onPressed: onPressed,
                ),
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
