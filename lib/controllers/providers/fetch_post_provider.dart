import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/core/services/post/post_query.dart';
import 'package:socialmediaapp/models/post_model.dart';

class FriendPostNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  FriendPostNotifier() : super(const AsyncLoading());
  Future<void> fetchFriendsPost(
      {required BuildContext context, required String currentUserEmail}) async {
    state = const AsyncLoading();
    log('loading$state');
    try {
      final client = GraphQLProvider.of(context).value;
      final followingFriends = await client.query(QueryOptions(
          document: getFollowingQuery,
          variables: {'email_id': currentUserEmail}));
      if (followingFriends.hasException) {
        log('one${followingFriends.exception.toString()}');
        throw Exception(followingFriends.exception.toString());
      }
      log('fd${followingFriends.data}');

      //following friends of user
      final List<dynamic> followeeIds =
          followingFriends.data?['followers'] != null
              ? (followingFriends.data?['followers'] as List<dynamic>)
                  .map<dynamic>((follower) => follower['followee_id'])
                  .toList()
              : [];
      log('fff$followeeIds');
      if (followeeIds.isEmpty) {
        state = const AsyncData([]); // No posts to show
        return;
      }

      // posts of the follwing friends
      final friendsPosts = await client.query(
        QueryOptions(document: PostQuery().getPostsOfFriendsQuery),
      );
      log('data${friendsPosts.data}');
      if (friendsPosts.data == null) {
        state = AsyncData([]);
        return;
      }
      List<Post> posts = [];

      for (dynamic post in friendsPosts.data?['posts']) {
        log('postuid${post['user_id']}');
        final friendDetails = await client.query(QueryOptions(
            document: getUserProfileQuery,
            variables: {'email_id': post['user_id']}));

        if (friendDetails.hasException) {
          log('two${followingFriends.exception.toString()}');
          // log('data${friendDetails.data}');
          throw Exception(friendDetails.exception.toString());
        }
        log('userdata${friendDetails.data}');
        final user = friendDetails.data?['user_by_pk'];
        posts.add(Post(
          postId: post['post_id'],
          description: post['description'],
          imageUrl: post['image_url']??'',
          taggedFriends:List<String>.from(post['tagged_friends'] ?? []),
          createdAt: DateTime.parse(post['created_at']),
          updatedAt:  post['updated_at'] != null ? DateTime.parse(post['updated_at']) : DateTime.now(),
          userId: post['user_id'],
          userName: user?['user_name'],
          userEmail: user?['email_id'],
          userProfile: user?['user_profile']??'',
        ));
      }

      state = AsyncData(posts); // Success state
      log('$state');
    } catch (e) {
      state = AsyncError(e, StackTrace.current); // Error state
      log('$state');
    }
  }
}

final friendPostsProvider =
    StateNotifierProvider<FriendPostNotifier, AsyncValue<List<Post>>>(
  (ref) => FriendPostNotifier(),
);
