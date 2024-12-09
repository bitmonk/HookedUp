import 'package:hooked_up/model/feed_post_model.dart';

List<FeedPostModel> dummyFeedPosts = [
  FeedPostModel(
    userName: 'j.williams',
    location: 'New York, USA',
    profileImage: 'assets/images/explainer/fishing.png',
    postImage: 'assets/images/main/fishing_pic.png',
    likeCount: '200',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    comments: [
      'Lorem ipsum!',
      'Great post!',
      'Looking awesome!',
    ],
    timeAgo: '2 hours ago',
  ),
  FeedPostModel(
    userName: 'm.smith',
    location: 'Los Angeles, USA',
    profileImage: 'assets/images/explainer/profile.png',
    postImage: 'assets/images/explainer/profile.png',
    likeCount: '500',
    description:
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    comments: [
      'Amazing!',
      'So cool!',
      'Can’t wait to try this!',
    ],
    timeAgo: '4 hours ago',
  ),
  FeedPostModel(
    userName: 'l.jones',
    location: 'London, UK',
    profileImage: 'assets/images/explainer/profile2.png',
    postImage: 'assets/images/explainer/profile2.png',
    likeCount: '350',
    description:
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    comments: [
      'Incredible!',
      'This is the best!',
    ],
    timeAgo: '1 day ago',
  ),
];
