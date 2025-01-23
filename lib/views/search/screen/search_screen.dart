import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/viewmodels/search/searched_userbuilder_viewmodel.dart';
import 'package:socialmediaapp/viewmodels/search/user_builder_viewmodel.dart';
import 'package:socialmediaapp/views/search/widget/searchbar.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});
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
          ? userBuilderViewModel(
              ref: ref,
              context: context,
            ) // If the search bar is empty, show all users
          : searchedUserViewModel(ref: ref,
              context: context,
              userName: controller.text.trim(),
            ), //If the search bar has input, display filtered search results
    );
  }
}

final searchQueryProvider = StateProvider<String>((ref) => "");
