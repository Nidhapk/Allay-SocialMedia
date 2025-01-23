import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/main/screen/main_screen.dart';
import 'package:socialmediaapp/views/search/widget/shimmer_builder.dart';
import 'package:socialmediaapp/views/search/widget/user_builder.dart';

Widget searchedUserViewModel(
    {required BuildContext context, required String userName,required WidgetRef ref}) {
  return Query(
    options: QueryOptions(
      document: getSearchedUserQuery,
      variables: {
        'user_name': '%$userName%',
      },
    ),
    builder: (result, {fetchMore, refetch}) {
      if (result.isLoading) {
        return shimmerBuilder(
          context: context,
        );
      } else if (result.hasException) {
        return Center(
          child: Text(
            result.exception.toString(),
          ),
        );
      }
      List users = result.data?['user'] ?? [];
      log('uuu$result');
      if (users.isEmpty) {
        return const Center(
          child: Text(
            'No user found',
          ),
        );
      } else {
        return userBuilder(pageController: pageController,ref: ref,
          itemCount: users.length,
          userName: (index) => users[index]['user_name'] as String,
          emailId: (index) => users[index]['email_id'] as String,
        );
      }
    },
  );
}
