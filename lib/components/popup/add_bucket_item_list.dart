import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/utils/colors.dart';

Future<dynamic> showAddBucketItemList({
  required BuildContext context,
  required String title,
  String? content,
  required String buttonText,
  required VoidCallback onPressed,
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
              Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Icon(
                  Icons.check_circle_outline_rounded,
                  size: 50.r,
                  color: AppColors.disconnectButton,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading),
              ),
              SizedBox(height: 12.h),
              if (content != null)
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF212221).withValues(alpha: 0.6),
                  ),
                ),
              SizedBox(
                height: 14.h,
              ),
              Container(
                color: Color(0xFFFFFFFC),
                height: 58.h,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Item Title',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF212221),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
                    fillColor: const Color(0xF5F5F5F5),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                color: Color(0xFFFFFFFC),
                height: 116.h,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: 'Item Description',
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF212221),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 24.w),
                    fillColor: const Color(0xF5F5F5F5),
                    filled: true,
                  ),
                ),
              )
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
