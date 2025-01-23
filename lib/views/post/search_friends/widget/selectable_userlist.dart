import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/viewmodels/tag/tag_searcheduser_viewmodel.dart';
import 'package:socialmediaapp/views/post/search_friends/widget/selectable_usertile.dart';



Widget selectableUserList(
    {required int itemCount,
    required String Function(int index) userName,
    required String Function(int index) emailId,
    required PageController pageController,
    required WidgetRef ref,required dynamic users
    }) {
      final taggedFriends = ref
              .watch(taggedFriendsProvider)
              .taggedUsers;
  return ListView.builder(
    itemCount: itemCount,
    itemBuilder: (context, index) {
      return selectableUserTile(onTag: (){
          ref
                  .read(taggedFriendsProvider.notifier)
                  .toggleTag(users[index]['email_id']);
              log('ttt$taggedFriends');
      },icon:  taggedFriends.contains(users[index]['email_id'])
                ? Icons.radio_button_checked
                : Icons.radio_button_off_outlined ,
        // onTap: () {
        //   // if (emailId(index) == FirebaseAuth.instance.currentUser?.email) {
        //   //   // Navigate to ProfileScreen (index 1) if the email matches

        //   //   pageController.jumpToPage(1);
        //   //   ref.read(currentIndexProvider.notifier).state = 1;
        //   //   Navigator.pop(context);
        //   // } else {
        //   //   // Navigate to searched users profile if the email doesn't match
        //   //   Navigator.of(context).push(
        //   //     MaterialPageRoute(
        //   //       builder: (context) => SearchedUserProfileScreen(
        //   //         emailId: emailId(index),
        //   //       ),
        //   //     ),
        //   //   );
        //   // }
        // },
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
