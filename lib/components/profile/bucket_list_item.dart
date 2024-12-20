import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBucketListItem extends StatelessWidget {
  final String title;
  final String desctiption;
  final bool? options;
  const CustomBucketListItem({
    super.key,
    required this.title,
    required this.desctiption,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            options == true
                ? Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.asset(
                        'assets/images/explainer/profile.png',
                        height: 40.h,
                        width: 40.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    if (options == true)
                      Icon(
                        Icons.check_circle_outline_rounded,
                        size: 20.sp,
                        color: Color(0xFFD7D9C9),
                      ),
                  ],
                ),
                SizedBox(height: 3.sp),
                Text(
                  desctiption,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        options == true
            ? GestureDetector(
                onTap: () {
                  print('Button clicked...');
                },
                child: Container(
                  height: 27.h,
                  width: 58.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: Color(0xFFD88F48),
                  ),
                  child: Center(
                    child: Text(
                      "Done",
                      style: TextStyle(
                        color: Color(0xFFF5F5F5),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            : SvgPicture.asset(
                'assets/images/icons/three_dots.svg',
                colorFilter:
                    ColorFilter.mode(Color(0xFFD9D9D9), BlendMode.srcIn),
              ),
      ],
    );
  }
}
