import 'package:hooked_up/model/feed_post_model.dart';

List<FeedPostModel> dummyFeedPosts = [
  FeedPostModel(
    postid: 1,
    userName: 'j.williams',
    location: 'New York, USA',
    profileImage: 'assets/images/explainer/fishing.png',
    postImage: 'assets/images/main/fishing_pic.png',
    likeCount: 200,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet',
    comments: [
      Comment(
        userName: 'Jane Smith',
        text: 'Lorem ipsum!',
        timeAgo: '5h',
      ),
      Comment(
        userName: 'Bob Brown',
        text: 'Great post!',
        timeAgo: '10m',
      ),
      Comment(
        userName: 'Alice Green',
        text: 'Looking awesome!',
        timeAgo: '15h',
      ),
    ],
    timeAgo: '2 hours ago',
  ),
  FeedPostModel(
    postid: 2,
    userName: 'm.smith',
    location: 'Los Angeles, USA',
    profileImage: 'assets/images/explainer/profile.png',
    postImage: 'assets/images/explainer/profile.png',
    likeCount: 500,
    description:
        'Sed do eiusmod tempor incpostidunt ut labore et dolore magna aliqua.',
    comments: [
      Comment(
        userName: 'Tom Hardy',
        text: 'Amazing!',
        timeAgo: '30m',
      ),
      Comment(
        userName: 'Sophia Blue',
        text: 'So cool!',
        timeAgo: '45m',
      ),
      Comment(
        userName: 'Emma White',
        text: 'Can’t wait to try this!',
        timeAgo: '1d ',
      ),
    ],
    timeAgo: '4 hours ago',
  ),
  FeedPostModel(
    postid: 3,
    userName: 'l.jones',
    location: 'London, UK',
    profileImage: 'assets/images/explainer/profile2.png',
    postImage: 'assets/images/explainer/profile2.png',
    likeCount: 350,
    description:
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    comments: [
      Comment(
        userName: 'Olivia Brown',
        text: 'Incredible!',
        timeAgo: '2h',
      ),
      Comment(
        userName: 'Liam Black',
        text: 'This is the best!',
        timeAgo: '3d',
      ),
    ],
    timeAgo: '1 day ago',
  ),
  // Repeat similar structure for other posts with unique postids
];
