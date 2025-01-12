import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/components/subscription/subscription_card.dart';
import 'package:hooked_up/utils/colors.dart';

class SubscriptionSelectPlan extends StatefulWidget {
  const SubscriptionSelectPlan({super.key});

  @override
  State<SubscriptionSelectPlan> createState() => _SubscriptionSelectPlanState();
}

class _SubscriptionSelectPlanState extends State<SubscriptionSelectPlan> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
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
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Subscribe to Hooked Up',
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFFD88F48),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: RichText(
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          'Choose the subscription that fits you best!',
                                      style: TextStyle(
                                        color: const Color(0xFF212221),
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' You can cancel anytime. ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: const Color(0xFF212221)
                                            .withValues(alpha: 0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              child: SubscriptionCard(
                                durationTitle: '3 Months',
                                amount: 11.11,
                                perTitle: 'per month',
                                button: true,
                                isSelected: selectedIndex == 0,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: SubscriptionCard(
                                durationTitle: 'Quarterly',
                                amount: 12.12,
                                perTitle: 'per quarter',
                                button: false,
                                isSelected: selectedIndex == 1,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              child: SubscriptionCard(
                                durationTitle: 'Yearly',
                                amount: 13.13,
                                perTitle: 'per year',
                                button: false,
                                isSelected: selectedIndex == 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45.w, right: 44.w, bottom: 51.h),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: GreenButton(
                      text: 'SELECT PLAN',
                      onPressed: () {
                        showClosablePopup(
                            context: context,
                            title: 'Subscription Updated',
                            buttonText: 'OKAY',
                            content:
                                'Your Subscription plan has been updated successfully.',
                            onPressed: () {
                              Get.back();
                            });
                      },
                    ),
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
