import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/openseason/request_join_popup.dart';
import 'package:hooked_up/components/orange_button.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/utils/colors.dart';

class RequestSentCard extends StatefulWidget {
  const RequestSentCard({
    super.key,
  });

  @override
  State<RequestSentCard> createState() => _RequestSentCardState();
}

class _RequestSentCardState extends State<RequestSentCard> {
  bool _sentRequest = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 308.w, // Reduced width
      height: 161.h, // Set a fixed height if needed
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15.r), // Reduced border radius
      ),
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.fromLTRB(12.w, 11.h, 10.w, 0.h), // Reduced padding
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Morning Fishing Trip - Join Me!',
                        style: TextStyle(
                          fontSize: 12.sp, // Reduced font size
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 8.h, // Reduced space between text
                      ),
                      Text(
                        "Hey everyone! I'll be heading out on the boat this Saturday morning for some fishing.",
                        style: TextStyle(fontSize: 10.sp), // Reduced font size
                      ),
                      SizedBox(
                        height: 10.h, // Reduced spacing
                      ),
                      Text(
                        'Event Location',
                        style: TextStyle(
                          fontSize: 8.sp, // Reduced font size
                          color: Color(0xFF212221).withAlpha(60),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 57.h, // Reduced image size
                        width: 55.w, // Reduced image size
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/main/fishing_pic.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.h, // Reduced space
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Date:',
                                style: TextStyle(
                                  color: AppColors.fadedText.withAlpha(60),
                                  fontSize: 7.sp, // Reduced font size
                                )),
                            TextSpan(
                              text: ' 23/04/2024',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 7.sp, // Reduced font size
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h, // Reduced space
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Category:',
                                style: TextStyle(
                                  color: AppColors.fadedText.withAlpha(60),
                                  fontSize: 8.sp, // Reduced font size
                                )),
                            TextSpan(
                              text: ' Fishing',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.sp, // Reduced font size
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h, // Reduced space
                      ),
                      Container(
                        height: 20.h,
                        width: 64.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(
                              width: 1,
                              color: AppColors.heading,
                            ),
                            color: Colors.transparent),
                        child: Center(
                          child: Text(
                            'Request Sent',
                            style: TextStyle(
                              color: AppColors.heading,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 9.h, // Reduced space
          ),
          Divider(
            height: 1,
            color: Color(0xFFFFFFFC),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16.w,
                top: 6.h,
                right: 21.w,
                bottom: 7.h), // Reduced padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Hosted by:',
                      style: TextStyle(
                        fontSize: 8.sp, // Reduced font size
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF212221).withAlpha(60),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    SizedBox(
                      height: 12.h,
                      width: 12.w,
                      child: CircleAvatar(
                        backgroundImage: const AssetImage(
                            'assets/images/explainer/profile2.png'),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      ' Sarah Smith',
                      style: TextStyle(
                        fontSize: 8.sp, // Reduced font size
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2B361C),
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset(
                  'assets/images/icons/three_dots.svg',
                  colorFilter:
                      ColorFilter.mode(Color(0xFFD9D9D9), BlendMode.srcIn),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
