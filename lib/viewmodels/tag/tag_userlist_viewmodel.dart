
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/main/screen/main_screen.dart';
import 'package:socialmediaapp/views/post/search_friends/widget/selectable_userlist.dart';
import 'package:socialmediaapp/views/search/widget/shimmer_builder.dart';

class UserListForTagViewModel extends ConsumerWidget {
  const UserListForTagViewModel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final taggedFriends =
    //     ref.watch(taggedFriendsProvider); // Watch the tagged friends provider

    return Query(
      options: QueryOptions(
        document: getAllUsersQuery,
      ),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading) {
          return shimmerBuilder(context: context);
        } else if (result.hasException) {
          return Center(
            child: Text(result.exception.toString()),
          );
        }

        final users = result.data?['user'] ?? [];

        return Consumer(builder: (context, ref, child) {
           // Watch the taggedFriends provider

          return selectableUserList(
           users: users,
            pageController: pageController,
            ref: ref,
            itemCount: users.length,
            userName: (index) => users[index]['user_name'] as String,
            emailId: (index) => users[index]['email_id'] as String,
           
          );
        });
      },
    );
  }
}
