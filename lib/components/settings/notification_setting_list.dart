import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hooked_up/utils/colors.dart';

class NotificationSettingList extends StatefulWidget {
  const NotificationSettingList({super.key});

  @override
  State<NotificationSettingList> createState() =>
      _NotificationSettingListState();
}

class _NotificationSettingListState extends State<NotificationSettingList> {
  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      decoration: BoxDecoration(
        // color: Colors.amber[100],
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Color(0xFFE4E7EC),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notification 1',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: FlutterSwitch(
              height: 20.h,
              width: 36.w,
              toggleSize: 10,
              activeColor: AppColors.heading,
              inactiveColor: Color(0xFFF2F4F7),
              value: isToggled,
              onToggle: (value) {
                setState(() {
                  isToggled = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
