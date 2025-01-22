import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hooked_up/utils/colors.dart';

class StatusCard extends StatefulWidget {
  final bool eventRequests;
  final GestureTapCallback? onThreeDotTap;
  final String? status;
  final bool? showStar;
  final bool? hideButton;
  final bool? extraOption;

  const StatusCard({
    super.key,
    this.eventRequests = false,
    this.onThreeDotTap,
    this.status,
    this.showStar,
    this.hideButton,
    this.extraOption,
  });

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  bool _starClicked = false;
  Color _getButtonColor() {
    switch (widget.status) {
      case 'accepted':
        return AppColors.requestAccepted;
      case 'rejected':
        return AppColors.requestRejected;
      case 'request_sent':
        return AppColors.requestSent;
      case 'attended':
        return AppColors.requestAttended;
      default:
        return AppColors.heading;
    }
  }

  String _getButtonText() {
    switch (widget.status) {
      case 'accepted':
        return 'Accepted';
      case 'rejected':
        return 'Rejected';
      case 'request_sent':
        return 'Request Sent';
      case 'attended':
        return 'Attended';
      default:
        return 'Accepted';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 385.w,
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.w, 15.h, 14.w, 0.h),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Morning Fishing Trip - Join Me!',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _starClicked = !_starClicked;
                              });
                            },
                            child: Icon(
                              _starClicked ? Icons.star : Icons.star_border,
                              size: 15,
                              color: _starClicked
                                  ? AppColors.heading
                                  : Color(0xFF767676),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Text(
                          "Hey everyone! I'll be heading out on the boat this Saturday morning for some fishing. Planning to hit the water around sunrise and see what we can catch. \n just a relaxed day on the water with ..",
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        'Event Location',
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: Color(0xFF212221).withAlpha(60),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 73.h,
                        width: 73.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/main/fishing_pic.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Date:',
                                style: TextStyle(
                                  color: AppColors.fadedText.withAlpha(60),
                                  fontSize: 9.sp,
                                )),
                            TextSpan(
                              text: ' 23/04/2024',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Category:',
                                style: TextStyle(
                                  color: AppColors.fadedText.withAlpha(60),
                                  fontSize: 9.sp,
                                )),
                            TextSpan(
                              text: ' Fishing',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      widget.hideButton == true
                          ? SizedBox.shrink()
                          : Container(
                              height: 26.h,
                              width: 86.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                  width: 1,
                                  color: _getButtonColor(),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  _getButtonText(),
                                  style: TextStyle(
                                    color: _getButtonColor(),
                                    fontSize: 9.sp,
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
            height: 19.h,
          ),
          Divider(
            height: 1,
            color: Color(0xFFFFFFFC),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 21.w, bottom: 8.h, top: 7, right: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.eventRequests == false
                    ? Row(
                        children: [
                          Text(
                            'Hosted by:',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF212221).withAlpha(60),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          SizedBox(
                            height: 14.h,
                            width: 14.w,
                            child: CircleAvatar(
                              backgroundImage: const AssetImage(
                                  'assets/images/explainer/profile2.png'),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            ' Sarah Smith',
                            style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2B361C),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Text(
                            'Event Requests',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Color(0xFF212221).withAlpha(60),
                            ),
                          ),
                          SizedBox(
                            width: 9.w,
                          ),
                          Container(
                            height: 22.h,
                            width: 22.w,
                            decoration: BoxDecoration(
                              color: AppColors.heading,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 9.sp,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                    .h, // Use the same value for width and height
                                decoration: BoxDecoration(
                                  shape:
                                      BoxShape.circle, // This makes it circular
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
                                  width: 21
                                      .h, // Use the same value for width and height
                                  decoration: BoxDecoration(
                                    shape: BoxShape
                                        .circle, // This makes it circular
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
                    SizedBox(
                      width: 15.w,
                    ),
                    GestureDetector(
                      onTap: widget.onThreeDotTap,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
