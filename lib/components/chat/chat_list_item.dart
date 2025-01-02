import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooked_up/components/popup/closable_popup.dart';
import 'package:hooked_up/components/popup/report_closable_popup.dart';
import 'package:hooked_up/screen/chat/chat_page.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatPage()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 22.h, right: 23.w, left: 23.w),
        child: Column(
          children: [
            Slidable(
              endActionPane: ActionPane(
                motion: DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: ((context) {
                      showClosableReportPopup(
                          context: context,
                          title: 'Confirm Report',
                          buttonText: 'SUBMIT',
                          content:
                              'Are you sure you want to report this user? This action will notify our team for review. Please provide details.',
                          onPressed: () {});
                    }),
                    icon: Icons.warning_amber_rounded,
                    backgroundColor: Color(0xFFF5F5F5),
                  ),
                  SlidableAction(
                    onPressed: ((context) {
                      showClosablePopup(
                          context: context,
                          title: 'Delete Chat?',
                          buttonText: 'YES',
                          content:
                              'Are you sure you want to delete this \n chat?',
                          onPressed: () {});
                    }),
                    icon: Icons.delete_forever_outlined,
                    backgroundColor: Color(0xFFD84848),
                  ),
                ],
              ),
              // endActionPane: ,
              child: Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.asset(
                        'assets/images/explainer/profile.png',
                        fit: BoxFit.cover,
                        height: 53.h,
                        width: 53.w,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sarah Smith',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Lorem ipsum dolor sit amet, conse...',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF212221).withAlpha(60),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          '12:37',
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: Color(0xFF212221).withAlpha(60),
                          ),
                        ),
                        Container(
                          height: 22.h,
                          width: 22.w,
                          decoration: BoxDecoration(
                            color: Color(0xFF5DCA54),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
