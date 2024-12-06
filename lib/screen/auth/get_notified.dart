import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/green_button.dart';

class GetNotified extends StatefulWidget {
  const GetNotified({super.key});

  @override
  State<GetNotified> createState() => _GetNotifiedState();
}

class _GetNotifiedState extends State<GetNotified> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 45.w, top: 97.0, right: 45),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(
                  color: Color(0xFFD7D9C9),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: SvgPicture.asset('assets/images/icons/bell.svg'),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                'Get Notified!',
                style: TextStyle(
                  fontSize: 22.sp,
                  color: const Color(0xFFD88F48),
                  fontWeight: FontWeight.w700,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Keep up with updates, events and chats from your friends. ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF212221),
                      ),
                    ),
                    TextSpan(
                      text:
                          'You can manage your notifications through Settings .',
                      style: TextStyle(
                        color: const Color(0xFF212221).withOpacity(0.6),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 41.h,
              ),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: 340.w,
                      child: SvgPicture.asset(
                        'assets/images/icons/phone_background.svg',
                        height: 347.h,
                        width: 258.w,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 210.h,
                          width: 340.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 62.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x30000000),
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 42.h,
                                            width: 45.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: const CircleAvatar(
                                              radius: 100,
                                              backgroundImage: AssetImage(
                                                  'assets/images/explainer/fishing.png'),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 4,
                                            right: 0,
                                            child: Container(
                                              height: 14.h,
                                              width: 14.h,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFD7D9C9),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/images/splash/logo.svg',
                                                  height: 6.68.h,
                                                  width: 6.68.w,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Jake Williams',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Sent you a message',
                                            style: TextStyle(
                                              color: const Color(0xFF212221)
                                                  .withOpacity(0.6),
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(top: 15.0.h),
                                            child: Text(
                                              '2m',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color: const Color(0xFF212221)
                                                      .withOpacity(0.6)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 62.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x30000000),
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 42.h,
                                            width: 45.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: const CircleAvatar(
                                              radius: 100,
                                              backgroundImage: AssetImage(
                                                  'assets/images/explainer/profile.png'),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 4,
                                            right: 0,
                                            child: Container(
                                              height: 14.h,
                                              width: 14.h,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFD7D9C9),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/images/splash/logo.svg',
                                                  height: 6.68.h,
                                                  width: 6.68.w,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Mary Jackson',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Sent you a message',
                                            style: TextStyle(
                                              color: const Color(0xFF212221)
                                                  .withOpacity(0.6),
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(top: 15.0.h),
                                            child: Text(
                                              '2m',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color: const Color(0xFF212221)
                                                      .withOpacity(0.6)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 62.h,
                                width: 340.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x30000000),
                                      blurRadius: 2,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 42.h,
                                            width: 45.h,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: const CircleAvatar(
                                              radius: 100,
                                              backgroundImage: AssetImage(
                                                  'assets/images/explainer/profile2.png'),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 4,
                                            right: 0,
                                            child: Container(
                                              height: 14.h,
                                              width: 14.h,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFD7D9C9),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  'assets/images/splash/logo.svg',
                                                  height: 6.68.h,
                                                  width: 6.68.w,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Sarah Smith',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Sent you a message',
                                            style: TextStyle(
                                              color: const Color(0xFF212221)
                                                  .withOpacity(0.6),
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(top: 15.0.h),
                                            child: Text(
                                              '2m',
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color: const Color(0xFF212221)
                                                      .withOpacity(0.6)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                  child: GreenButton(
                      text: 'TURN ON NOTIFICATIONS', onPressed: () {})),
            ],
          ),
        ),
      ),
    );
  }
}
