class User {
  final int userId;
  final String userName;
  final String userProfile;
  final String emailId;
  final String password;

  User({
    required this.userId,
    required this.userName,
    required this.userProfile,
    required this.emailId,
    required this.password,
  });

  // Method to display user details (excluding sensitive information like password)
  @override
  String toString() {
    return 'User(userId: $userId, userName: $userName, userProfile: $userProfile, emailId: $emailId)';
  }

  // Factory method to create a user from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'] as int,
      userName: json['user_name'] as String,
      userProfile: json['user_profile'] as String,
      emailId: json['email_id'] as String,
      password: json['password'] as String,
    );
  }

  // Method to convert a user object to JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': userName,
      'user_profile': userProfile,
      'email_id': emailId,
      'password': password,
    };
  }
}
