import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/components/subscription/subscription_card.dart';
import 'package:hooked_up/screen/auth/get_notified.dart';

class SubscriptionManager extends StatefulWidget {
  const SubscriptionManager({super.key});

  @override
  State<SubscriptionManager> createState() => _SubscriptionManagerState();
}

class _SubscriptionManagerState extends State<SubscriptionManager> {
  int selectedIndex = 0;
  int cardSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 252, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 10.0,
              height: 10.0,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 31.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Subscription Manager',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFD88F48),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Text(
                        'Current Subscription',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
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
                          durationTitle: 'Monthly',
                          amount: 11.11,
                          perTitle: 'per month',
                          button: true,
                          isSelected: selectedIndex == 0,
                        ),
                      ),
                      Divider(
                        height: 50.h,
                        color: const Color(0xFFF5F5F5),
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Payment Details'),
                          SizedBox(
                            height: 27.h,
                            width: 53.w,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF606C38),
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 7.w),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              onPressed: () {},
                              child: Center(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFFF3FAFE),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  cardSelectedIndex = 0;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 7.h),
                                height: 43.h,
                                width: 73.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(11.r),
                                  border: cardSelectedIndex == 0
                                      ? Border.all(
                                          color: const Color(0xFFD88F48),
                                        )
                                      : Border.all(
                                          color: Colors.transparent,
                                        ),
                                ),
                                child: SvgPicture.asset(
                                    'assets/images/icons/mastercard.svg'),
                              ),
                            ),
                            SizedBox(width: 9.h),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  cardSelectedIndex = 1;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 7.h),
                                height: 43.h,
                                width: 73.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF5F5F5),
                                  borderRadius: BorderRadius.circular(11.r),
                                  border: cardSelectedIndex == 1
                                      ? Border.all(
                                          color: const Color(0xFFD88F48),
                                        )
                                      : Border.all(
                                          color: Colors.transparent,
                                        ),
                                ),
                                child: SvgPicture.asset(
                                    'assets/images/icons/visa.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Stack(
                        children: [
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Mary Jackson',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              contentPadding: EdgeInsets.only(
                                  top: 24.h, left: 24.w, bottom: 12.h),
                            ),
                          ),
                          Positioned(
                            left: 24.w,
                            top: 10.h,
                            child: Text(
                              'Name on Card',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color(0xFF212221),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Stack(
                        children: [
                          TextField(
                            readOnly: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: '**** **** **** 1234',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.r),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF5F5F5),
                              contentPadding: EdgeInsets.only(
                                  top: 24.h, left: 24.w, bottom: 12.h),
                            ),
                          ),
                          Positioned(
                            left: 24.w,
                            top: 10.h,
                            child: Text(
                              'Card Number',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: const Color(0xFF212221),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Expiry',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF5F5F5),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 18.h,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'CVV',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF5F5F5),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 18.h,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80.h),
                      SizedBox(
                        width: double.infinity,
                        child: GreenButton(
                          text: 'CHANGE SUBSCRIPTION',
                          onPressed: () {
                            showClosablePopup(
                                context: context,
                                title: "Welcome to Your Free Trial!",
                                content:
                                    "Your 7-day free trial is now active. Make the most of it and explore Hooked Up!",
                                buttonText: "Get Started",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const GetNotified(),
                                    ),
                                  );
                                });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
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
