import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int postId;
  final String description;
  final String? imageUrl;
  final List<String> taggedFriends;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userId;
  final String userName;
  final String userEmail;
  final String userProfile;

  const Post({
    required this.postId,
    required this.description,
    this.imageUrl,
    required this.taggedFriends,
    required this.createdAt,
     this.updatedAt,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userProfile,
  });

  @override
  List<Object?> get props => [
        postId,
        description,
        imageUrl,
        taggedFriends,
        createdAt,
        updatedAt,
        userId,
        userName,
        userEmail,
        userProfile,
      ];
}
