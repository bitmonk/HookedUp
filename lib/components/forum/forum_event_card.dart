import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/screen/forum/single_forum.dart';
import 'package:hooked_up/utils/colors.dart';

class ForumEventCard extends StatefulWidget {
  final bool myEventOptions;
  final VoidCallback onTap;
  const ForumEventCard({
    super.key,
    required this.myEventOptions,
    required this.onTap,
  });

  @override
  State<ForumEventCard> createState() => _ForumEventCardState();
}

class _ForumEventCardState extends State<ForumEventCard> {
  void _showAddPostBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Color(0xFFFFFFFC),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create a Post',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFD88F48),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 33.h),
                  GestureDetector(
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
                ],
              ),
              SizedBox(height: 12.h),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/main/camera.svg',
                        height: 24.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/main/gallery.svg',
                        height: 28.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Photo Gallery',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.myEventOptions
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
            width: widget.myEventOptions ? 1 : 0,
            color:
                widget.myEventOptions ? AppColors.heading : Color(0xFFF5F5F5),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: widget.myEventOptions
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
                          if (!widget.myEventOptions)
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
            SizedBox(height: 24.h),
            Divider(height: 1, color: Color(0xFFFFFFFC)),
            SizedBox(height: 13.h),
            Padding(
              padding: EdgeInsets.only(left: 21.w, bottom: 18.h, right: 12.w),
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
                          fontWeight: widget.myEventOptions
                              ? FontWeight.w700
                              : FontWeight.w400,
                          color: AppColors.fadedText.withAlpha(60),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: SizedBox(
                      height: 26.h,
                      width: 26.w,
                      child: SvgPicture.asset(
                        'assets/images/icons/three_dots.svg',
                        colorFilter: ColorFilter.mode(
                            Color(0xFFD9D9D9), BlendMode.srcIn),
                      ),
                    ),
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
