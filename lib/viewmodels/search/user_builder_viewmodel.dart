import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/main/screen/main_screen.dart';
import 'package:socialmediaapp/views/search/widget/shimmer_builder.dart';
import 'package:socialmediaapp/views/search/widget/user_builder.dart';

Widget 
userBuilderViewModel(
    {required BuildContext context,required  WidgetRef ref }) {
  return Query(
      options: QueryOptions(
          document: getAllUsersQuery,),
      builder: (result, {fetchMore, refetch}) {
        if (result.isLoading) {
          return shimmerBuilder(context: context);
        } else if (result.hasException) {
          return Center(
            child: Text(result.exception.toString()),
          );
        }
        final users = result.data?['user'];
        return userBuilder(pageController:pageController ,ref: ref,
          itemCount: users.length,
          userName: (index) => users[index]['user_name'] as String,
          emailId: (index) => users[index]['email_id'] as String,
        );
      });
}
