import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/profile/widgets/profile_container.dart';

Widget userDetailsViewModel({required BuildContext context}) {
  return Query(
    options: QueryOptions(
      document: getUserProfileQuery,
      variables: {
        'email_id': FirebaseAuth.instance.currentUser?.email,
      },
    ),
    builder: (result, {fetchMore, refetch}) {
      if (result.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (result.hasException) {
        return Center(
          child: Text('Error: ${result.exception.toString()}'),
        );
      }

      final user = result.data?['user_by_pk'];

      if (user == null || user.isEmpty) {
        return const Center(
          child: Text('No user found with this email.'),
        );
      }
      return profileContainer(
        context: context,
        userName: user['user_name'],
        email: user['email_id'],
      );
    },
  );
}
