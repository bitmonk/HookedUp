import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooked_up/components/chat/sent_chat_message.dart';
import 'package:hooked_up/components/chat/single_chat_message.dart';
import 'package:hooked_up/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final List<String> _messages = [];
  final now = DateTime.now();
  late String formattedDate;
  XFile? _pickedImage;

  String? get _pickedImagePath => _pickedImage?.path;

  @override
  void initState() {
    final now = DateTime.now();
    formattedDate = DateFormat('dd MMM, yyyy').format(now);
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
      });
      _controller.clear();
    }
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? galleryPhoto =
        await picker.pickImage(source: ImageSource.gallery);
    if (galleryPhoto != null) {
      setState(() {
        _pickedImage = galleryPhoto;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(now);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          surfaceTintColor: AppColors.backgroundColor,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 25.h,
                width: 25.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF9FA482).withAlpha(42),
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 19,
                ),
              ),
            ),
          ),
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/explainer/profile.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sarah Smith',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF212221).withAlpha(60),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Color(0xFFD9D9D9),
                size: 30,
              ),
              onPressed: () {
                print('More options tapped');
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 36.h,
                      ),
                      Center(
                        child: Text(
                          formattedDate,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Color(0xFF212221).withAlpha(60),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      SingleChatMessage(
                          message:
                              'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet'),
                      ..._messages.map((message) {
                        return SentChatMessage(
                          message: message,
                          imagePath: _pickedImagePath,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 27.h),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: _focusNode,
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Write a message...',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        _focusNode.hasFocus
                            ? Icons.send_rounded
                            : Icons.camera_alt_outlined,
                        color: Color(0xFF606C38),
                        size: 30.h,
                      ),
                      onPressed: () {
                        if (_focusNode.hasFocus) {
                          _sendMessage();
                        } else {
                          pickImageFromGallery();
                        }
                      },
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
