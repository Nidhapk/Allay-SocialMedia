import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/providers/providers.dart';
import 'package:socialmediaapp/views/search/screen/searched_userprofile_screen.dart';
import 'package:socialmediaapp/views/search/widget/user_tile.dart';

Widget userBuilder(
    {required int itemCount,
    required String Function(int index) userName,
    required String Function(int index) emailId,
    required PageController pageController,
    required WidgetRef ref}) {
  return ListView.builder(
    itemCount: itemCount,
    itemBuilder: (context, index) {
      return userTile(
        onTap: () {
          if (emailId(index) == FirebaseAuth.instance.currentUser?.email) {
            // Navigate to ProfileScreen (index 1) if the email matches

            pageController.jumpToPage(1);
            ref.read(currentIndexProvider.notifier).state = 1;
            Navigator.pop(context);
          } else {
            // Navigate to AddPostScreen if the email doesn't match
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchedUserProfileScreen(
                  emailId: emailId(index),
                ),
              ),
            );
          }
        },
        context: context,
        userName: userName(
          index,
        ),
        emailId: emailId(
          index,
        ),
      );
    },
  );
}
