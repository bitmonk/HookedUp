import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/subscription/subscription_card.dart';

class SelectPlan extends StatefulWidget {
  const SelectPlan({super.key});

  @override
  State<SelectPlan> createState() => _SelectPlanState();
}

class _SelectPlanState extends State<SelectPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF9FA482).withOpacity(0.42),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Color(0xFF2B361C),
                        ),
                      ),
                    ),
                    title: SvgPicture.asset(
                      'assets/images/splash/logo.svg',
                      height: 54.h,
                      width: 52.w,
                    ),
                    centerTitle: true,
                  ),
                ),
                SizedBox(height: 31.h),
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
                                  color:
                                      const Color(0xFF212221).withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const SubscriptionCard(),
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: GreenButton(
                          text: 'NEXT',
                          onPressed: () {},
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
    );
  }
}
