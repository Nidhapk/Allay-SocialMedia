import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/providers/fetch_post_provider.dart';
import 'package:socialmediaapp/views/home/widgets/post_builder.dart';
import 'package:socialmediaapp/views/profile/view_posts/tagged_friends/screen/tagged_friends.dart';
import 'package:socialmediaapp/views/shimmers/post/post_buulder_shimmer.dart';

Widget friendsPostViewModel(
    {required WidgetRef ref, required BuildContext context}) {
  final friendPostsState = ref.watch(friendPostsProvider);
  return friendPostsState.when(
      data: (posts) {
        return posts.isEmpty
            ? const Center(child: Text('No posts to show'))
            : postBuilder(
                onTaggedFriendsPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ViewTaggedFriends()));
                },
                itemCount: posts.length,
                userName: (index) => posts[index].userName,
                email: (index) => posts[index].userEmail,
                profileImage: (index) => posts[index].userProfile.isEmpty
                    ? const AssetImage('assets/gallery.png')
                    : NetworkImage(posts[index].userProfile),
                description: (index) => posts[index].description,
                image: (index) => posts[index].imageUrl ?? '',
                timePeriod: (index) => posts[index].updatedAt.toString() == ''
                    ? 'Posted ${posts[index].createdAt} ago'
                    : 'Updated ${posts[index].updatedAt} ago');
      },
      error: (error, stack) {
        log('error$error');
        return Center(child: Text('Error: $error'));
      },
      loading: () => Center(
            child: shimmerPostBuilder(),
          ));
}
