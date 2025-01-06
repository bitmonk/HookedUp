import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/home/connection_requests.dart';
import 'package:hooked_up/utils/colors.dart';

class ActivityFeed extends StatefulWidget {
  const ActivityFeed({super.key});

  @override
  State<ActivityFeed> createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
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
              // height: 18.h,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.heading,
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConnectionRequests(),
                          ),
                        );
                      },
                      child: Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2.w,
                            color: Color(0xFFD7D9C9),
                          ),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Icon(
                          Icons.add_rounded,
                          color: Color(0xFF9FA482),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Connection Requests',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Approve or deny your requests',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xFF212221).withAlpha(60),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 22.h,
                      width: 22.h,
                      decoration: BoxDecoration(
                        color: AppColors.heading,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: Text(
                          '2',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 9.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            indent: 0,
            color: Color(0xFFF5F5F5),
          ),
          SizedBox(
            height: 7.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w),
                    child: Text(
                      'Yesterday',
                      style: TextStyle(
                        color: Color(0xFF212221).withAlpha(60),
                      ),
                    ),
                  ),
                  NotificationListItem(
                    read: true,
                  ),
                  NotificationListItem(
                    read: false,
                  ),
                  NotificationListItem(
                    read: false,
                  ),
                  NotificationListItem(
                    read: false,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Divider(
                    height: 1,
                    indent: 0,
                    color: Color(0xFFF5F5F5),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25.w, top: 17.h, bottom: 12.h),
                    child: Text(
                      'Monday',
                      style: TextStyle(
                        color: Color(0xFF212221).withAlpha(60),
                      ),
                    ),
                  ),
                  NotificationListItem(
                    read: false,
                  ),
                  NotificationListItem(
                    read: false,
                  ),
                  NotificationListItem(
                    read: false,
                  ),
                  NotificationListItem(
                    read: false,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NotificationListItem extends StatelessWidget {
  final bool read;

  const NotificationListItem({
    super.key,
    required this.read, // Mark it as a required parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        children: [
          Container(
            height: 80.h,
            color: read
                ? const Color(0xFFFFFFFC)
                : const Color(0xFFD7D9C9).withAlpha(26),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24.w),
                  child: SizedBox(
                    height: 53.h,
                    width: 53.w,
                    child: CircleAvatar(
                      backgroundImage: const AssetImage(
                          'assets/images/explainer/profile2.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 12.w,
                          top: 19.h,
                          bottom: 19.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sarah Smith',
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'Has commented on your post',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF212221).withAlpha(60),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w, top: 19.h),
                        child: Text(
                          '20 mins ago',
                          style: TextStyle(
                              color: const Color(0XFF212221).withAlpha(60),
                              fontSize: 9.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
