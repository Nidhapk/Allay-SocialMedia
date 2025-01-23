import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/profile/widgets/follower_shimmer.dart';
import 'package:socialmediaapp/views/profile/widgets/statwith_label.dart';

Widget followersViewModel(
    {required BuildContext context, required String emailId}) {
  return Query(
    options: QueryOptions(
      document: getFollowersQuery,
      variables: {'email_id': emailId},
    ),
    builder: (result, {fetchMore, refetch}) {
      if (result.isLoading) {
        return followerShimmer(
          context: context,
        );
      } else if (result.hasException) {
        return Center(
          child: Text(
            result.exception.toString(),
          ),
        );
      }
      List followers = result.data?['followers'] ?? [];
      return stateWithLabel(
        context: context,
        stat: followers.length.toString(),
        label: 'Followers',
      );
    },
  ); //followers
}
