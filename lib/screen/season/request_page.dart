import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/custom_radio_button.dart';
import 'package:hooked_up/components/form_input_field.dart';
import 'package:hooked_up/components/openseason/status_card.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/components/popup/report_closable_popup.dart';
import 'package:hooked_up/screen/season/create_season_event.dart';
import 'package:hooked_up/screen/season/my_events.dart';
import 'package:hooked_up/utils/colors.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  bool myTabIsClicked = false;

  final List<String> allStatuses = [
    'request_sent',
    'accepted',
    'rejected',
    'attended'
  ];
  String? _selectedOption = 'all';

  @override
  Widget build(BuildContext context) {
    final filteredStatuses = _selectedOption == 'all'
        ? allStatuses
        : allStatuses.where((status) => status == _selectedOption).toList();

    filteredStatuses.sort((a, b) => a.compareTo(b));

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 26.h),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48.h,
                    child: FormInputField(
                      labelText: 'Search',
                      obscureText: false,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                GestureDetector(
                  onTap: () {
                    Get.to(() => CreateSeasonEvent());
                  },
                  child: Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD7D9C9),
                    ),
                    child: Icon(
                      Icons.add_rounded,
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 9.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => MyEvents());
                          },
                          child: Text(
                            'Request Sent',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showStatusBottomSheet();
                          },
                          child: Container(
                            height: 27.h,
                            width: 85.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Color(0xFF9FA482),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                      color: _selectedOption == 'attended'
                                          ? Colors.white
                                          : Color(0xFF2B361C),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_downward_rounded,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  _selectedOption == 'attended'
                      ? Padding(
                          padding: EdgeInsets.only(left: 7.w, right: 10.w),
                          child: Text(
                            'After attending an event, click the star to recommend it.Your recommended events will appear in your profile.',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                      children: filteredStatuses.map((status) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 22.h,
                            ),
                            StatusCard(
                              onThreeDotTap: () {
                                showReportBottomSheet(context);
                              },
                              status: status,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                          ],
                        );
                      }).toList(),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showReportBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Color(0xFFFFFFFC),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 33.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w, top: 8.h),
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
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 25.w),
                leading: SvgPicture.asset(
                  'assets/images/icons/report.svg',
                  width: 25.w,
                ),
                title: Text(
                  'Report',
                  style: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  showClosableReportPopup(
                      context: context,
                      title: 'Confirm Report',
                      content:
                          'Are you sure you want to report this user? This action will notify our team for review. Please provide details.',
                      buttonText: 'SUBMIT',
                      onPressed: () {});
                },
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  showClosablePopup(
                      context: context,
                      title: 'Delete Event?',
                      buttonText: 'YES',
                      content: 'Are you sure you want to delete this event?',
                      onPressed: () {
                        Get.back();
                      });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/icons/delete.svg',
                        height: 28.h,
                        width: 30.w,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        );
      },
    );
  }

  void _showStatusBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Color(0xFFFFFFFC),
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 430.h,
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
                        'Filter by Status',
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
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9FA482).withAlpha(42),
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
              SizedBox(height: 31.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomRadioButton(
                        value: 'all',
                        groupValue: _selectedOption ?? '',
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Navigator.pop(context);
                        },
                        label: 'All',
                      ),
                      CustomRadioButton(
                        value: 'accepted',
                        groupValue: _selectedOption ?? '',
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Navigator.pop(context);
                        },
                        label: 'Accepted',
                      ),
                      CustomRadioButton(
                        value: 'request_sent',
                        groupValue: _selectedOption ?? '',
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Navigator.pop(context);
                        },
                        label: 'Request Sent',
                      ),
                      CustomRadioButton(
                        value: 'rejected',
                        groupValue: _selectedOption ?? '',
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Navigator.pop(context);
                        },
                        label: 'Rejected',
                      ),
                      CustomRadioButton(
                        value: 'attended',
                        groupValue: _selectedOption ?? '',
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                          Navigator.pop(context);
                        },
                        label: 'Attended',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        );
      },
    );
  }
}
