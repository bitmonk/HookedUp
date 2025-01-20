class Comment {
  final String userName;
  final String text;
  final String timeAgo;

  Comment({
    required this.userName,
    required this.text,
    required this.timeAgo,
  });
}

class FeedPostModel {
  final String userName;
  final String profileImage;
  final String location;
  final String postImage;
  int likeCount;
  final String description;
  final List<Comment> comments;
  final String timeAgo;
  bool isLiked;

  FeedPostModel({
    required this.userName,
    required this.profileImage,
    required this.location,
    required this.postImage,
    required this.likeCount,
    required this.description,
    required this.comments,
    required this.timeAgo,
    this.isLiked = false,
  });
}
