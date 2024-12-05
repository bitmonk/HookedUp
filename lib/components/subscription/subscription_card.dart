import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscriptionCard extends StatefulWidget {
  final String durationTitle;
  final double amount;
  final String perTitle;
  final bool button;
  final bool isSelected; // Added property to track if the card is selected

  const SubscriptionCard({
    super.key,
    required this.durationTitle,
    required this.amount,
    required this.perTitle,
    required this.button,
    required this.isSelected, // Passing the selection state
  });

  @override
  State<SubscriptionCard> createState() => _SubscriptionCardState();
}

class _SubscriptionCardState extends State<SubscriptionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 17, 20, 15),
      constraints: BoxConstraints(
        minHeight: 150.h,
        maxWidth: 345.w,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        border: widget.isSelected
            ? Border.all(
                color: const Color(0xFFD88F48), // Border color if selected
                width: 2.w,
              )
            : Border.all(
                color: Colors.transparent, // Transparent border if not selected
                width: 2.w,
              ),
        borderRadius: BorderRadius.all(
          Radius.circular(20.r),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.durationTitle, // Display duration title
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Lorem Ipsum',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'Lorem ipsum dolor sit amet',
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(
                  height: 14.h,
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
          ),
          // Right Column
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${widget.amount.toStringAsFixed(2)}', // Display price
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  widget.perTitle, // Display the per-title (e.g., per month)
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                // Conditional button rendering
                widget.button
                    ? SizedBox(
                        width: 92.w,
                        height: 35.h,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFD88F48),
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
                        ),
                      )
                    : const SizedBox
                        .shrink(), // If no button, return an empty space
              ],
            ),
          ),
        ],
      ),
    );
  }
}
