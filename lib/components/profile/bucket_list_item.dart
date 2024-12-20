import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBucketListItem extends StatelessWidget {
  final String title;
  final String desctiption;
  final String? image;
  final bool? checkMark;
  final bool? button;
  const CustomBucketListItem({
    super.key,
    required this.title,
    required this.desctiption,
    this.checkMark,
    this.button,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    if (this.button == true) {
      
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 3.sp,
            ),
            Text(
              desctiption,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SvgPicture.asset(
          'assets/images/icons/three_dots.svg',
          colorFilter: ColorFilter.mode(Color(0xFFD9D9D9), BlendMode.srcIn),
        ),
      ],
    );
  }
}
