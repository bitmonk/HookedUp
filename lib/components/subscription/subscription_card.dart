import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionCard extends StatefulWidget {
  const SubscriptionCard({super.key});

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 17, 20, 15),
      height: 150.h,
      width: 340.w,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: Border.all(
          color: const Color(0xFFD88F48),
          width: 2.w,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '3 Months',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Lorem Ipsum ',
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              const Text('Lorem ipsum dolor sit amet '),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'First 7 days for free',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFD88F48),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '\$xx.xx',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'per month',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFD88F48),
                  // padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Best Value",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xFFF3FAFE),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
