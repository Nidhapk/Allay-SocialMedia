import 'package:flutter/material.dart';
import 'package:socialmediaapp/viewmodels/profile/follow_unfollow_viewmodel.dart';
import 'package:socialmediaapp/views/home/widgets/sizedbox30.dart';
import 'package:socialmediaapp/views/profile/widgets/profile_container.dart';
import 'package:socialmediaapp/views/profile/widgets/user_stats.dart';

class SearchedUserProfileScreen extends StatelessWidget {
  final String emailId;
  const SearchedUserProfileScreen({super.key, required this.emailId});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'User Name',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
          top: height * 0.02,
          bottom: height * 0.02,
        ),
        children: [
          profileContainer(
            context: context,
            userName: 'userName',
            email: 'email',
          ), //user details(username,email and profile)
          sizedbox30(
            context: context,
          ),

          userStats(
            emailId: emailId,
            context: context,
          ), // no.of followers,following & posts
          sizedbox30(
            context: context,
          ),
          connectionCkeckViewModel(
            context: context,
            emailId: emailId,
          ), //botton for follow or unfollow
          // postGridView(
          //   context: context,
          // ) //all posts of the user
        ],
      ),
    );
  }
}
