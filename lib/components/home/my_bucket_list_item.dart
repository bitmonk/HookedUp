import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBucketListItem extends StatefulWidget {
  const MyBucketListItem({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  State<MyBucketListItem> createState() => _MyBucketListItemState();
}

class _MyBucketListItemState extends State<MyBucketListItem> {
  bool _isSelected;

  _MyBucketListItemState() : _isSelected = false;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  void _toggleSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Item Title',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
                SizedBox(height: 3.sp),
                Text(
                  'Item Description',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: _toggleSelection,
          child: Container(
            height: 27.h,
            width: _isSelected ? 72.w : 58.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: !_isSelected ? Color(0xFFD88F48) : Color(0xFF606C38),
            ),
            child: SizedBox(
              height: 27.h,
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
        ),
      ],
    );
  }
}
