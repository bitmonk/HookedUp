import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/utils/colors.dart';

class SingleEventRequest extends StatefulWidget {
  const SingleEventRequest({super.key});

  @override
  State<SingleEventRequest> createState() => _SingleEventRequestState();
}

class _SingleEventRequestState extends State<SingleEventRequest> {
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
                color: const Color(0xFF9FA482).withAlpha(42),
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 22.w, top: 13.h),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Takes the size of its children
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.containerBackground,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(13.w, 15.h, 13.w, 8.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize
                                .min, // Ensures size is only for children
                            children: [
                              Text(
                                'Morning Fishing Trip - Join Me!',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 18.h,
                                        width: 18.w,
                                        child: CircleAvatar(
                                          backgroundImage: const AssetImage(
                                              'assets/images/explainer/profile2.png'),
                                        ),
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        ' Sarah Smith',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF2B361C),
                                        ),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: SizedBox(
                                      height: 15.h,
                                      width: 20.w,
                                      child: SvgPicture.asset(
                                        'assets/images/icons/three_dots.svg',
                                        colorFilter: ColorFilter.mode(
                                            Color(0xFFD9D9D9), BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: Colors.white),
                              Text(
                                "Hey everyone! I'll be heading out on the boat this Saturday morning for some fishing. Planning to hit the water around sunrise and see what we can catch. just a relaxed day on the water with good company. I've got some extra gear if you need it, and we'll be cruising around some great spots. \n \nLet's make it a fun day—hope to see you there!",
                              ),
                              SizedBox(height: 24.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Date:',
                                          style: TextStyle(
                                            color: AppColors.fadedText
                                                .withAlpha(60),
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' 23/04/2024',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Category',
                                    style: TextStyle(
                                      color: AppColors.fadedText.withAlpha(60),
                                      fontSize: 12.sp,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 4.h),
                              RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Location:',
                                      style: TextStyle(
                                        color:
                                            AppColors.fadedText.withAlpha(60),
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Dreamland Location',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24.h),
                              Container(
                                height: 353.h,
                                width: 353.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/main/fishing_pic.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 29.h),
                              Divider(color: Colors.white),
                              GestureDetector(
                                onTap: () => _showAttendingDialog(),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Attending:'),
                                    Row(
                                      children: [
                                        Stack(
                                          children: [
                                            SizedBox(
                                              width: 42.w,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 21.h,
                                                    width: 21
                                                        .h, // Same value for width and height
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: ClipOval(
                                                      child: Image.asset(
                                                        'assets/images/explainer/profile.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: 0,
                                                    child: Container(
                                                      height: 21.h,
                                                      width: 21.h,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: ClipOval(
                                                        child: Image.asset(
                                                          'assets/images/explainer/profile2.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 57.h, top: 12.h),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xFFD88F48),
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'REQUEST TO JOIN',
                      style: TextStyle(
                        color: const Color(0xFFF3FAFE),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showAttendingDialog() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      backgroundColor: AppColors.backgroundColor,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Attending',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFD88F48),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(15.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9FA482).withAlpha(60),
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
              SizedBox(
                height: 24.h,
              ),
              AttendingListItem(),
              SizedBox(
                height: 12.h,
              ),
              AttendingListItem(),
              SizedBox(
                height: 12.h,
              ),
              AttendingListItem(),
              SizedBox(
                height: 12.h,
              ),
              AttendingListItem(),
              SizedBox(
                height: 12.h,
              ),
            ],
          ),
        );
      },
    );
  }
}

class AttendingListItem extends StatelessWidget {
  const AttendingListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: Image.asset(
            'assets/images/explainer/profile.png',
            width: 50.w,
            height: 50.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sarah Smith',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'sarah.s1',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.containerBackground,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Icon(
              Icons.close,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
