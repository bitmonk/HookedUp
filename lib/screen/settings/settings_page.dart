import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/home/heading_text_orange.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/utils/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                      Scaffold.of(context).openDrawer(); // Open the drawer
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 23.w),
              child: HeadTextOrange(
                title: 'Settings',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 25.h, 25.w, 36.h),
              child: Column(
                children: [
                  SettingsListTile(
                    onTap: () {},
                    title: 'Edit Profile',
                  ),
                  SettingsListTile(
                    onTap: () {},
                    title: 'Change Password',
                  ),
                  SettingsListTile(
                    onTap: () {},
                    title: 'Community Guidelines',
                  ),
                  SettingsListTile(
                    onTap: () {},
                    title: 'Subscription Manager',
                  ),
                  SettingsListTile(
                    onTap: () {},
                    title: 'FAQ’s',
                  ),
                  SettingsListTile(
                    onTap: () {},
                    title: 'Help',
                  ),
                  SettingsListTile(
                    onTap: () {},
                    title: 'Terms & Conditions',
                  ),
                  SettingsListTile(
                    onTap: () {},
                    title: 'Privacy Policy',
                  ),
                  SettingsListTile(
                    onTap: () {},
                    title: 'Invite Friends',
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: double.infinity,
                    child: GreenButton(
                        text: 'LOG OUT',
                        onPressed: () {
                          showClosablePopup(
                              context: context,
                              title: 'Are you sure you want to log out?',
                              buttonText: 'YES',
                              onPressed: () {});
                        }),
                  ),
                  SizedBox(height: 11.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF2B361C),
                          width: 0.5.w,
                        ),
                      ),
                    ),
                    child: Text('Delete Account'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsListTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SettingsListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Container(
          height: 58.h,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.red,
            border: Border.all(
              width: 1.w,
              color: Color(0xFF9FA482),
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF212221),
                    fontSize: 16.sp,
                  ),
                ),
                Icon(Icons.arrow_forward_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
