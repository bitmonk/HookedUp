import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedPost extends StatelessWidget {
  const FeedPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title heading -->
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
              child: Row(
                children: [
                  SizedBox(
                    height: 35.h,
                    width: 35.h,
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/fishing.png'),
                    ),
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'j.williams',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'Location, location',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF212221).withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(
                        'assets/images/icons/three_dots.svg',
                        height: 5.h,
                        width: 19.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.0.h),
              child: Container(
                height: 430.h,
                width: double.infinity,
                color: Colors.green,
                child: Image.asset(
                  'assets/images/main/fishing_pic.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            // Action buttons -->
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  SizedBox(
                    height: 25.h,
                    width: 24.h,
                    child: SvgPicture.asset('assets/images/icons/heart.svg'),
                  ),
                  SizedBox(width: 12.w),
                  SizedBox(
                    height: 25.h,
                    width: 24.h,
                    child: SvgPicture.asset('assets/images/icons/comment.svg'),
                  ),
                  SizedBox(width: 12.w),
                  SizedBox(
                    height: 25.h,
                    width: 24.h,
                    child: SvgPicture.asset('assets/images/icons/share.svg'),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 25.h,
                    width: 24.h,
                    child: SvgPicture.asset('assets/images/icons/save.svg'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 12.h),
              child: Text(
                '200 likes',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0.w, right: 18.w),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'j.williams',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF000000),
                      ),
                    ),
                    TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et ...',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 12.h),
              child: Text(
                'View more',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF212221).withOpacity(0.6),
                ),
              ),
            ),
            // Comment section -->
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'j.williams',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          TextSpan(
                            text: ' Lorem ipsum!',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 12.0.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'j.williams',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF000000),
                            ),
                          ),
                          TextSpan(
                            text: ' Lorem ipsum!',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'View all comments',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF212221).withOpacity(0.6),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0.h),
                    child: Text(
                      '2 hours ago',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF212221).withOpacity(0.6),
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
