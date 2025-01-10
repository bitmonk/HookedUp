import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/home/heading_text_orange.dart';
import 'package:hooked_up/components/home/tag_connection.dart';
import 'package:hooked_up/components/popup/report_closable_popup.dart';
import 'package:hooked_up/components/popup/send_note.dart';
import 'package:hooked_up/utils/colors.dart';

class LinkConnections extends StatefulWidget {
  const LinkConnections({super.key});

  @override
  State<LinkConnections> createState() => _LinkConnectionsState();
}

class _LinkConnectionsState extends State<LinkConnections> {
  void _showConnectionsBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Color(0xFFFFFFFC),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              height: 709.h,
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Select Connection',
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFD88F48),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 33.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color:
                                const Color(0xFF9FA482).withValues(alpha: 0.42),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Color(0xFF2B361C),
                            size: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  FormInputField(labelText: 'Search', obscureText: false),
                  SizedBox(height: 31.h),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(15, (index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.h),
                            child: TagConnection(),
                          );
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            );
          },
        );
      },
    );
  }

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
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 22.w, top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadTextOrange(
              title: 'Link Connections',
            ),
            SizedBox(height: 12.h),
            Text(
              'Tap the circles to suggest connections between your contacts. Select two users, hit "Connect," and they’ll receive your suggestion. \n \nIf both contacts accept your suggestion, they’ll be linked in a new chat.',
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 140.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _showConnectionsBottomSheet();
                  },
                  child: Container(
                    height: 144.h,
                    width: 125.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                    child: Center(
                      child: Text(
                        'Select\nConnection',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFF212221).withAlpha(60),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 26.w,
                ),
                Container(
                  height: 48.h,
                  width: 48.w,
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9FA482).withValues(alpha: 0.42),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: const Icon(
                      Icons.add_rounded,
                      color: Color(0xFF2B361C),
                      size: 24,
                    ),
                  ),
                ),
                SizedBox(
                  width: 23.w,
                ),
                GestureDetector(
                  onTap: () {
                    _showConnectionsBottomSheet();
                    print('object');
                  },
                  child: Container(
                    height: 144.h,
                    width: 125.w,
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(11.r),
                    ),
                    child: Center(
                      child: Text(
                        'Select\nConnection',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFF212221).withAlpha(60),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.h,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFD88F48),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: () {
                  showSendNotePopup(context: context, title: 'Send a note');
                },
                child: Text(
                  'CONNECT',
                  style: TextStyle(
                    color: const Color(0xFFF3FAFE),
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
