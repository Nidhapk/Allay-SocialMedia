import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socialmediaapp/views/home/widgets/post_container.dart';

Widget postBuilder(
    {required int itemCount,
    required String Function(int) userName,
    required String Function(int) email,
    required String Function(int) description,
    required String Function(int) image,
    required ImageProvider<Object>? Function(int) profileImage,
    required String Function(int) timePeriod,
    required void Function()? onTaggedFriendsPressed}) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: itemCount,
    itemBuilder: (context, index) {
      log('$userName');
      log('$email');
      return postContainer(
        context: context,
        userName: userName(index),
        email: email(index),
        description: description(index),
        imageUrl: image(index),
        backgroundImage: profileImage(index),
        timePeriod: timePeriod(index).toString(),
        onTaggedFriendsPressed: onTaggedFriendsPressed,
      );
    },
  );
}
