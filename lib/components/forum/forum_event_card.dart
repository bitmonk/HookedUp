import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/screen/forum/single_forum.dart';
import 'package:hooked_up/utils/colors.dart';

class ForumEventCard extends StatelessWidget {
  final bool myEventOptions;

  ForumEventCard({
    super.key,
    required this.myEventOptions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !myEventOptions
          ? null
          : () {
              Get.to(() => SingleForum());
            },
      child: Container(
        width: 385.w,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            width: myEventOptions ? 1 : 0,
            color: myEventOptions ? AppColors.heading : Color(0xFFF5F5F5),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: myEventOptions
                  ? EdgeInsets.fromLTRB(20.w, 15.h, 18.w, 0.h)
                  : EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Forum Title',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          if (!myEventOptions)
                            SvgPicture.asset('assets/images/icons/pin.svg'),
                          SizedBox(width: 6.w),
                          Text(
                            '2/03/2024',
                            style: TextStyle(
                              fontSize: 9.sp,
                              color: AppColors.fadedText,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      SizedBox(
                        height: 14.h,
                        width: 14.w,
                        child: CircleAvatar(
                          backgroundImage: const AssetImage(
                              'assets/images/explainer/profile2.png'),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        ' Sarah Smith',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000).withAlpha(37),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Container(
                        height: 5.h,
                        width: 5.w,
                        decoration: BoxDecoration(
                          color: AppColors.greenButton,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF000000).withAlpha(37),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "Ipsum dolor sit amet, consectetur adipiscig elit, sed do eiusmod tempor incididunt ut labore et dolore?",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            SizedBox(height: 19.h),
            Divider(height: 1, color: Color(0xFFFFFFFC)),
            Padding(
              padding: EdgeInsets.only(
                  left: 21.w, bottom: 18.h, top: 13.h, right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/images/icons/replies.svg'),
                      SizedBox(width: 4.w),
                      Text(
                        '233 Replies',
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: myEventOptions
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: AppColors.fadedText.withAlpha(60),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/images/icons/three_dots.svg',
                    colorFilter:
                        ColorFilter.mode(Color(0xFFD9D9D9), BlendMode.srcIn),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
