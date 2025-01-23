import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/viewmodels/tag/tag_searcheduser_viewmodel.dart';
import 'package:socialmediaapp/viewmodels/tag/tag_userList_viewmodel.dart';
import 'package:socialmediaapp/views/profile/widgets/gradient_button.dart';
import 'package:socialmediaapp/views/search/widget/searchbar.dart';

class TagSearchScreen extends ConsumerWidget {
  TagSearchScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery =
        ref.watch(searchQueryProvider); // Listen to search query
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: searchAppBar(
        controller: controller,
        onChanged: (value) {
          ref.read(searchQueryProvider.notifier).state = value.trim();
        },
      ), // AppBar with a custom search bar

      body: searchQuery.isEmpty
          ? const UserListForTagViewModel() // If the search bar is empty, show all users

          : searchedUserForTagViewModel(
              ref: ref,
              context: context,
              userName: controller.text.trim(),
            ), //If the search bar has input, display filtered search results
      bottomNavigationBar: BottomAppBar(
        child: gradientButton(
           child: const Text('Tag friends') ,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}

final searchQueryProvider = StateProvider<String>((ref) => "");
