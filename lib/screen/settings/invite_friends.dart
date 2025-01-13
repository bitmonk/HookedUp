import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/components/settings/invite_box.dart';
import 'package:hooked_up/utils/colors.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key});

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 18.w),
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
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Invite Friends',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFD88F48),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Invite friends to join. Enter their email to send an invite',
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      InviteBox(
                        title: 'Enter email to send an invite:',
                        inputFieldTitle: 'Email',
                        buttonTitle: 'SEND INVITE',
                        onPressed: () {},
                      ),
                      SizedBox(height: 25.h),
                      InviteBox(
                        title: 'Copy your link to share ::',
                        inputFieldTitle: 'Link',
                        buttonTitle: 'COPY LINK',
                        onPressed: () {},
                      ),
                    ],
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
