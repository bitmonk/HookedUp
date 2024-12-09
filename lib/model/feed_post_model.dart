class FeedPostModel {
  final String userName;
  final String profileImage;
  final String location;
  final String postImage;
  final String likeCount;
  final String description;
  final List<String> comments;
  final String timeAgo;

  FeedPostModel({
    required this.userName,
    required this.profileImage,
    required this.location,
    required this.postImage,
    required this.likeCount,
    required this.description,
    required this.comments,
    required this.timeAgo,
  });
}
