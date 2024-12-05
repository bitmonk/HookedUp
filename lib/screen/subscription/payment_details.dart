import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/green_button.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/components/subscription/subscription_card.dart';
import 'package:hooked_up/screen/auth/get_notified.dart';

class PaymentDetails extends StatefulWidget {
  const PaymentDetails({super.key});

  @override
  State<PaymentDetails> createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  int selectedIndex = 0;
  int cardSelectedIndex = 0;

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
                          'Payment details',
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
                      Divider(
                        height: 50.h,
                        color: const Color(0xFFF5F5F5),
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      SizedBox(
                        height: 5.h,
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
                                  // ignore: prefer_const_constructors
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
                                  // ignore: prefer_const_constructors
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
                            decoration: InputDecoration(
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
                          Positioned(
                            left: 24.w, // Adjust horizontal position
                            top: 10.h, // Adjust vertical position
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
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
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
                          Positioned(
                            left: 24.w, // Adjust horizontal position
                            top: 10.h, // Adjust vertical position
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
                      // Row(
                      //   children: [
                      //     TextField(
                      //       keyboardType: TextInputType.number,
                      //       decoration: InputDecoration(
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(20.r),
                      //           borderSide: BorderSide.none,
                      //         ),
                      //         filled: true,
                      //         fillColor: const Color(0xFFF5F5F5),
                      //         contentPadding: EdgeInsets.symmetric(
                      //           horizontal: 24.w,
                      //           vertical: 18.h,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
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
                          text: 'SELECT PLAN',
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
                      const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      )
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
