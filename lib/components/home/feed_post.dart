import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooked_up/components/popup/report_closable_popup.dart';
import 'package:hooked_up/model/dummy_data.dart';
import 'package:hooked_up/model/feed_post_model.dart';
import 'package:hooked_up/screen/home/home_reel_feed.dart';

class FeedPost extends StatefulWidget {
  const FeedPost({
    super.key,
  });

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  bool _viewMoreClicked = false;
  bool _isLiked = false;
  bool _clickedSave = false;
  final snackBar = const SnackBar(
    content: Text('Post saved to collections..'),
    showCloseIcon: true,
  );

  void _showCommentBox(List<Comment> comments) {
    showModalBottomSheet(
      backgroundColor: const Color(0xFFFFFFFC),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 19.w),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 156.0.w),
                      child: Text(
                        'Comments',
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFD88F48),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFF9FA482)
                                  .withValues(alpha: 0.42),
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                constraints: BoxConstraints(maxHeight: 500.h),
                child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${comment.userName} \n',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                  TextSpan(
                                    text: comment.text,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            comment.timeAgo,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF212221)
                                  .withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 44.w, right: 29.w, bottom: 28.h),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/explainer/profile.png'),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Add a comment...',
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF212221),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 24.w),
                          fillColor: const Color(0xFFF5F5F5),
                          filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyFeedPosts.length,
      itemBuilder: (context, index) {
        var post = dummyFeedPosts[index];
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Row(
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 35.h,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(post.profileImage),
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.userName,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Text(
                          post.location,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color:
                                const Color(0xFF212221).withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              constraints: BoxConstraints(
                                maxHeight: 430.h,
                                maxWidth: double.infinity,
                              ),
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.only(),
                                  child: Container(
                                    height: 200.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xFFFFFFFC),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 21.0.h, right: 24.w),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: EdgeInsets.all(8.w),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF9FA482)
                                                    .withValues(alpha: 0.42),
                                                shape: BoxShape.circle,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Icon(
                                                  Icons.close,
                                                  color: Color(0xFF2B361C),
                                                  size: 24,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 34.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 25.w,
                                              ),
                                              SvgPicture.asset(
                                                  'assets/images/icons/report.svg'),
                                              SizedBox(
                                                width: 17.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showClosableReportPopup(
                                                      context: context,
                                                      title: 'Confirm Report',
                                                      content:
                                                          'Are you sure you want to report this user? This action will notify our team for review. Please provide details.',
                                                      buttonText: 'SUBMIT',
                                                      onPressed: () {});
                                                },
                                                child: Text(
                                                  'Report',
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xFF000000),
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            color: const Color(0xFFFFFFFC),
                            height: 30.h,
                            child: SvgPicture.asset(
                              'assets/images/icons/three_dots.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0.h),
                child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      _isLiked = !_isLiked;
                      if (_isLiked) {
                        post.likeCount++;
                      } else {
                        post.likeCount--;
                      }
                    });
                  },
                  child: Container(
                    height: 343.h,
                    width: double.infinity,
                    color: Colors.green,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeReelFeed(),
                          ),
                        );
                      },
                      child: Image.asset(
                        post.postImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLiked = !_isLiked;
                          if (_isLiked) {
                            post.likeCount++;
                          } else {
                            post.likeCount--;
                          }
                        });
                      },
                      child: SizedBox(
                        height: 25.h,
                        width: 24.h,
                        child: SvgPicture.asset(
                          'assets/images/icons/heart.svg',
                          colorFilter: _isLiked
                              ? const ColorFilter.mode(
                                  Color(0xFFD88F48), BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    GestureDetector(
                      onTap: () {
                        _showCommentBox(post.comments);
                      },
                      child: SizedBox(
                        height: 25.h,
                        width: 24.h,
                        child:
                            SvgPicture.asset('assets/images/icons/comment.svg'),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    SizedBox(
                      height: 25.h,
                      width: 24.h,
                      child: SvgPicture.asset('assets/images/icons/share.svg'),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _clickedSave = !_clickedSave;
                          if (_clickedSave) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      },
                      child: SizedBox(
                        height: 25.h,
                        width: 24.h,
                        child: SvgPicture.asset(
                          'assets/images/icons/save.svg',
                          colorFilter: _clickedSave
                              ? const ColorFilter.mode(
                                  Color(0xFFD88F48), BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 12.h),
                child: Text(
                  '${post.likeCount}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0.w, right: 18.w),
                child: RichText(
                  maxLines: _viewMoreClicked ? null : 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: post.userName,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF000000),
                        ),
                      ),
                      TextSpan(
                        text: post.description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 12.h),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _viewMoreClicked = !_viewMoreClicked;
                    });
                  },
                  child: Text(
                    _viewMoreClicked ? 'View less' : 'View more',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF212221).withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (post.comments.isNotEmpty) ...[
                      for (var i = 0; i < post.comments.length && i < 2; i++)
                        Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${post.comments[i].userName} ',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                                TextSpan(
                                  text: post.comments[i].text,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                    GestureDetector(
                      onTap: () {
                        _showCommentBox(post.comments);
                      },
                      child: Text(
                        'View all comments',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF212221).withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0.h),
                      child: Text(
                        post.timeAgo,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF212221).withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
