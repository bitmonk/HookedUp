import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/home/heading_text_orange.dart';
import 'package:hooked_up/utils/colors.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: HeadTextOrange(title: 'Privacy Policy'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: 24.w, right: 26.w, top: 12.h, bottom: 88.h),
                child: SizedBox(
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed mollis mauris a leo feugiat dignissim in nec augue. Mauris nec pretium risus, eget euismod nibh. Sed ac semper ipsum. Proin varius, urna a congue scelerisque, sapien turpis iaculis magna, malesuada pellentesque quam nunc nec dui. Pellentesque elit ex, eleifend eget lorem sed, facilisis placerat sem. Morbi nisi eros, suscipit nec dignissim ut, interdum eu ex. Maecenas semper mauris id ligula finibus malesuada. Pellentesque suscipit condimentum nibh vitae tempor. Curabitur et nulla leo. Maecenas commodo lectus nec imperdiet mollis. Morbi tincidunt odio nec augue facilisis consectetur. In dapibus dui vitae metus auctor elementum.\n \nIn id fringilla nulla. Sed efficitur placerat nunc, in scelerisque tellus facilisis et. Cras blandit arcu in urna accumsan, ac efficitur purus rhoncus. Nunc rutrum a velit non sollicitudin. Vivamus risus quam, egestas et sem a, maximus vestibulum massa. Sed eget nulla nibh. Sed sollicitudin vulputate dapibus. Donec bibendum, turpis a laoreet ultricies, ipsum quam pellentesque purus, ut aliquet enim dolor ac arcu. Praesent id volutpat justo. \n  \nUt fermentum elit et sodales lobortis. Pellentesque euismod mauris sit amet nisl maximus sollicitudin. Nam in leo commodo, dapibus tellus eu, egestas mauris. Cras finibus nunc in nulla tempus, ac ullamcorper neque convallis. Sed at tellus interdum, molestie augue et, efficitur ex. Proin ultrices vel mauris at ultricies. Fusce lobortis lorem at massa lobortis maximus. Vivamus in orci vel elit imperdiet placerat. Nunc sagittis, velit vel convallis maximus, ex tortor fringilla nulla, eu finibus ipsum arcu in dolor. Nullam sit amet metus id turpis condimentum mollis eget at mauris. Aenean a euismod quam, vel finibus est.',
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
