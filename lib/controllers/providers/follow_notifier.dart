import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_connection_mutations.dart';

class FollowNotifier extends ValueNotifier<bool> {
  FollowNotifier() : super(false); // Default to not followed

  Future<void> followUser(BuildContext context, String followeeId,
      VoidCallback refetch) async {
    final followerId = FirebaseAuth.instance.currentUser?.email;

    if (followerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must be logged in to follow users.')),
      );
      return;
    }

    try {
      value = true; // Set loading state
      await GraphQLProvider.of(context).value.mutate(
        MutationOptions(
          document: followUserMutation,
          variables: {
            'follower_id': followerId,
            'followee_id': followeeId,
          },
        ),
      );

      refetch(); // Refresh followers
      value = true; // Update to followed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You are now following this user!')),
      );
    } catch (error) {
      value = false; // Reset to not followed on error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${error.toString()}')),
      );
      log('ee${error.toString()}');
    }
  }

  Future<void> unfollowUser(BuildContext context, String followeeId,
      VoidCallback refetch) async {
    final followerId = FirebaseAuth.instance.currentUser?.email;

    if (followerId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You must be logged in to unfollow users.')),
      );
      return;
    }

    try {
      value = true; // Set loading state
      await GraphQLProvider.of(context).value.mutate(
        MutationOptions(
          document: unfollowUserMutation,
          variables: {
            'current_userid': followerId,
            'friend_id': followeeId,
          },
        ),
      );

      refetch(); // Refresh followers
      value = false; // Update to not followed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You have unfollowed this user.')),
      );
    } catch (error) {
      value = true; // Reset to followed on error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${error.toString()}')),
      );
    }
  }
}
final followNotifierProvider = ChangeNotifierProvider<FollowNotifier>(
  (ref) => FollowNotifier(),
);