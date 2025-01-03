import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/utils/colors.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 25.h,
              width: 25.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF9FA482).withAlpha(42),
              ),
              child: Icon(
                Icons.arrow_back,
                size: 19,
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/explainer/profile.png',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sarah Smith',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF212221).withAlpha(60),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Color(0xFFD9D9D9),
              size: 30,
            ),
            onPressed: () {
              print('More options tapped');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                height: 2,
                color: Color(0xFFF5F5F5),
              ),
              SizedBox(
                height: 36.h,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 23.h, right: 12.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Image.asset(
                          'assets/images/explainer/profile.png',
                          width: 27,
                          height: 27,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  19, 12, 56, 12), // increased right padding
                              child: Text(
                                'Excepteur sint occaecat cupida tat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum sint occaecat',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 18.w,
                            bottom: 12.h,
                            child: Text(
                              '12:38',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.grey,
                              ),
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
        ),
      ),
    );
  }
}
