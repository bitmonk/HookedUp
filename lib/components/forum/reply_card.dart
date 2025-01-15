import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/utils/colors.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385.w,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 31.h,
                          width: 31.w,
                          child: CircleAvatar(
                            backgroundImage: const AssetImage(
                                'assets/images/explainer/profile2.png'),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Jessi Brown',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '2/03/2024',
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: AppColors.fadedText.withAlpha(60),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Text(
                  "Ipsum dolor sit amet, consectetur adipiscig elit, sed d o eiusmod tempor incididunt. \nTotam rem aperiam, eaque!",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 21.w, bottom: 12.h, top: 11.h, right: 12.w),
            child: Row(
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/images/icons/replies.svg'),
                    SizedBox(width: 4.w),
                    Text(
                      '233 Replies',
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.fadedText.withAlpha(60),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
