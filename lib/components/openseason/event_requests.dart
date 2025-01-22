import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/openseason/event_request_item.dart';
import 'package:hooked_up/components/openseason/single_event_request.dart';
import 'package:hooked_up/components/popup/link_connection_popup.dart';
import 'package:hooked_up/utils/colors.dart';

class EventRequests extends StatefulWidget {
  const EventRequests({super.key});

  @override
  State<EventRequests> createState() => EventRequestsState();
}

class EventRequestsState extends State<EventRequests> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 24.h, 24.w, 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Event Requests',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.heading,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  EventRequestBundle(),
                  SizedBox(
                    height: 24.h,
                  ),
                  EventRequestBundle(),
                  SizedBox(
                    height: 24.h,
                  ),
                  EventRequestBundle(),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventRequestBundle extends StatelessWidget {
  const EventRequestBundle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Color(0xFFF5F5F5),
        ),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => SingleEventRequest());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 57.h,
                      width: 57.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: DecorationImage(
                          image:
                              AssetImage('assets/images/main/fishing_pic.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Event Title',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Event Location',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                              Text(
                                'Dates',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '2/03/2024',
                      style: TextStyle(
                        fontSize: 9.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  EventRequestItem(),
                  EventRequestItem(),
                  EventRequestItem(),
                  EventRequestItem(),
                  EventRequestItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
