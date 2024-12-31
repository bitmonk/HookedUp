import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePostHome extends StatefulWidget {
  const CreatePostHome({super.key});

  @override
  State<CreatePostHome> createState() => _CreatePostHomeState();
}

class _CreatePostHomeState extends State<CreatePostHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 38.h,
            left: 24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 41.h,
                  width: 41.w,
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
              Padding(
                padding: EdgeInsets.only(left: 15.w, top: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create a Post",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFD88F48),
                      ),
                    ),
                    Image.asset('assets/images/explainer/profile.png'),
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
