
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/main/screen/main_screen.dart';
import 'package:socialmediaapp/views/post/search_friends/widget/selectable_userlist.dart';
import 'package:socialmediaapp/views/search/widget/shimmer_builder.dart';

Widget searchedUserForTagViewModel({
  required BuildContext context,
  required String userName,
  required WidgetRef ref,
}) {
  
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
      if (users.isEmpty) {
        return const Center(
          child: Text(
            'No user found',
          ),
        );
      } else {
        return selectableUserList(pageController: pageController,ref: ref,
         users: users,
          itemCount: users.length,
          userName: (index) => users[index]['user_name'] as String,
          emailId: (index) => users[index]['email_id'] as String,
        );
      }
    },
  );
}

//final taggedFriendsProvider = StateProvider<List<String>>((ref) => []);
class TaggedUsersNotifier extends ChangeNotifier {
 final List<String> _taggedUsers = [];

  List<String> get taggedUsers => _taggedUsers;

  // Toggle the tagging state for a given user
  void toggleTag(String userEmail) {
    if (_taggedUsers.contains(userEmail)) {
      _taggedUsers.remove(userEmail); // Remove the user from tagged list
    } else {
      _taggedUsers.add(userEmail); // Add the user to tagged list
    }

    notifyListeners(); // Notify listeners of state change
  }
}

// Define the provider for the TaggedUsersNotifier
final taggedFriendsProvider = ChangeNotifierProvider<TaggedUsersNotifier>(
  (ref) => TaggedUsersNotifier(),
);
