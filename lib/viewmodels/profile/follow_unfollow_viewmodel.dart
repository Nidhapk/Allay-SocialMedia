import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:socialmediaapp/controllers/providers/follow_notifier.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/profile/widgets/gradient_button.dart';

Widget connectionCkeckViewModel(
    {required BuildContext context, required String emailId}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Consumer(
    builder: (context, ref, child) {
      final followNotifier = ref.watch(followNotifierProvider); // Listen to the follow state
      return Query(
        options: QueryOptions(
          document: getFollowersQuery,
          variables: {'email_id': emailId},
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.isLoading) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: width * 0.8,
                height: height * 0.04,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          } else if (result.hasException) {
            return Center(
              child: Text(
                result.exception.toString(),
              ),
            );
          }
          List followers = result.data?['followers'] ?? [];
          final isFollowing = followers.any((follower) =>
              follower['follower_id'] ==
              FirebaseAuth.instance.currentUser?.email);
          return gradientButton(
              child:Text(isFollowing ? 'Unfollow' : 'Follow') , onPressed: () {
                if (isFollowing) {
                // Unfollow the user
                followNotifier.unfollowUser(context, emailId, refetch!);
              } else {
                // Follow the user
                followNotifier.followUser(context, emailId, refetch!);
              }
              });
        },
      );
    },
  );
}
