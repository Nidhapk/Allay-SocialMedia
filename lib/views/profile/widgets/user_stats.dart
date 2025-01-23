import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/viewmodels/profile/followers_viewmodel.dart';
import 'package:socialmediaapp/viewmodels/profile/following_viewmodel.dart';
import 'package:socialmediaapp/viewmodels/profile/postcount_viewmodel.dart/posts_count_viewmodel.dart';
import 'package:socialmediaapp/views/profile/widgets/vertical_divider.dart';

Widget userStats({required BuildContext context, required String emailId}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      followersViewModel(
        context: context,
        emailId: emailId,
      ), //followers
      verticalDividerK(
        context: context,
      ),
      followingViewModel(
        context: context,
        emailId: emailId,
      ), //following
      verticalDividerK(
        context: context,
      ),
      postCountViewModel(context: context, emailId: emailId) //posts
    ],
  );
}
