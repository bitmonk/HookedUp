import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/screen/auth/login.dart';
import 'package:hooked_up/screen/connections/link_connections.dart';
import 'package:hooked_up/screen/home/home_social_feed.dart';
import 'package:hooked_up/screen/settings/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 385.w,
      backgroundColor: const Color(0xFF2B361C),
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 74.0.h, left: 24.w),
                    child: Container(
                      height: 41.h,
                      width: 41.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF9FA482).withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        size: 25.h,
                        color: const Color(0xFF2B361C),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 70.h),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      title: Text(
                        'Home',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      onTap: () {
                        Get.to(() => HomeSocialFeed());
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Forums',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      onTap: () {
                        // Handle forum navigation here
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Link Connections',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      onTap: () {
                        Get.to(() => LinkConnections());
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Settings',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      onTap: () {
                        Get.to(SettingsPage());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0.h,
            left: 0.w,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/images/icons/logo2.svg',
                  height: 213.h,
                  width: 206.w,
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    // Use Get.to() to navigate to LoginPage
                    Get.to(() => const LoginPage());
                  },
                  child: Text(
                    'Log Out',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFFFFFF).withValues(alpha: 0.53),
                    ),
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
