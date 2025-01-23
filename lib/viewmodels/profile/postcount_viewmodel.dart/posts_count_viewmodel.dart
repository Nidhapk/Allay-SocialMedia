import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/profile/widgets/follower_shimmer.dart';
import 'package:socialmediaapp/views/profile/widgets/statwith_label.dart';

Widget postCountViewModel({required BuildContext context,
  required String emailId}){
   return Query(
    options: QueryOptions(
      document: getPostsQuery,
      variables: {'user_id': emailId},
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
      List posts = result.data?['posts'] ?? [];
      return stateWithLabel
      (
        context: context,
        stat: posts.length.toString(),
        label: 'Posts',
      );
    },
  );  
}