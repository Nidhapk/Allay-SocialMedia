import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/providers/fetch_post_provider.dart';
import 'package:socialmediaapp/viewmodels/home/followee_post_viewmodel.dart';
import 'package:socialmediaapp/views/home/widgets/home_appbar.dart';
import 'package:socialmediaapp/views/home/widgets/sizedbox30.dart';
import 'package:socialmediaapp/views/home/widgets/story_builder.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});


  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

   @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(friendPostsProvider.notifier).fetchFriendsPost(
            context: context,
            currentUserEmail: FirebaseAuth.instance.currentUser!.email!, // Replace dynamically
          );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(
        context: context,

        //searchbutton
        onTap: () {
          Navigator.pushNamed(
              context, '/SearchScreen'); //navigate to search page
        },
      ),
      body: ListView(
        children: [
          sizedbox30(context: context),
          storyBuilder(context: context), //stories of friends
          sizedbox30(context: context),
          friendsPostViewModel(ref: ref,context: context) //posts of friends
        ],
      ),
    );
  }
}
