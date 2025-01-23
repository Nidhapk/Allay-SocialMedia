import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/profile/view_posts/screen/view_posts_screen.dart';
import 'package:socialmediaapp/views/profile/widgets/post_gridview.dart';
import 'package:socialmediaapp/views/shimmers/post/post_grid_shimmer.dart';

Widget postGridViewModel(
    {required BuildContext context,
  }) {
      
  return Query(
    options: QueryOptions(
      document: getPostsQuery,
      variables: {
        'user_id': FirebaseAuth.instance.currentUser?.email,
      },
    ),
    builder: (result, {fetchMore, refetch}) {
      if (result.isLoading) {
        return postGridShimmer(
          context: context,
        );
      }
      if (result.hasException) {
        Center(
          child: Text(
            result.exception.toString(),
          ),
        );
      }
      List posts = result.data?['posts'] ?? [];
      if (posts.isEmpty) {
        return const Center(
          child: Text(
            'Nothing posted yet.',
          ),
        );
      }
      return postGridView(
          itemCount: posts.length,
          context: context,
          url: (index) => result.data?['posts'][index]['image_url'],
          onTap: (index) {
            
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>  ViewPostScreen(index: index,),
              ),
            );
          });
    },
  );
}
