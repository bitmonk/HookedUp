import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/utils/colors.dart';

class TagConnection extends StatefulWidget {
  const TagConnection({
    super.key,
  });

  @override
  State<TagConnection> createState() => _TagConnectionState();
}

class _TagConnectionState extends State<TagConnection> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          child: CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/explainer/profile.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sarah Smith',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'sarah.s1',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF212221).withAlpha(60),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          child: Container(
            height: 27.h,
            width: _isSelected ? 72.w : 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: _isSelected ? AppColors.greenButton : AppColors.heading,
            ),
            child: Center(
              child: Text(
                _isSelected ? "Selected" : "Select",
                style: TextStyle(
                  color: Color(0xFFF5F5F5),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
