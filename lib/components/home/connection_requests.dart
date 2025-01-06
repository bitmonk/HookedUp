import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/utils/colors.dart';

class ConnectionRequests extends StatefulWidget {
  const ConnectionRequests({super.key});

  @override
  State<ConnectionRequests> createState() => _ConnectionRequestsState();
}

class _ConnectionRequestsState extends State<ConnectionRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: const Color(0xFFFFFFFC),
        backgroundColor: const Color(0xFFFFFFFC),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFF2B361C),
              ),
            ),
          ),
        ),
        actions: [
          SizedBox(
            height: 48.h,
            width: 48.h,
            child: CircleAvatar(
              backgroundColor: const Color(0xFFD7D9C9),
              child: IconButton(
                iconSize: 22,
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/icons/notification.svg',
                  height: 22.h,
                  width: 21.w,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          SizedBox(
            height: 48.h,
            width: 48.h,
            child: Builder(
              builder: (BuildContext context) {
                return CircleAvatar(
                  backgroundColor: const Color(0xFFD7D9C9),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/icons/hamburger.svg',
                      height: 18.h,
                      width: 23.w,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 24.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connection Requests',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  ConnectionRequestListItem(),
                  ConnectionRequestListItem(),
                  ConnectionRequestListItem(),
                  ConnectionRequestListItem(),
                  ConnectionRequestListItem(),
                  ConnectionRequestListItem(),
                ],
              ),
            ),
            Divider(
              height: 1,
              indent: 0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class ConnectionRequestListItem extends StatelessWidget {
  const ConnectionRequestListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          SizedBox(
            height: 42.h,
            width: 42.w,
            child: CircleAvatar(
              backgroundImage:
                  const AssetImage('assets/images/explainer/profile2.png'),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sarah Smith',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'sarah.s1',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF212221).withAlpha(60),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 27.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        color: AppColors.greenButton,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'CONNECT',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Container(
                      height: 27.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Center(
                        child: Text(
                          'DENY',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff000000),
                          ),
                        ),
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
