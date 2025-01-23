import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/providers/providers.dart';
import 'package:socialmediaapp/viewmodels/bottom_navigation.dart';
import 'package:socialmediaapp/views/home/screen/home.dart';
import 'package:socialmediaapp/views/main/widget/floating_button.dart';
import 'package:socialmediaapp/views/profile/screen/profile_screen.dart';
 final PageController pageController = PageController();
class MainScreen extends ConsumerWidget {
  MainScreen({super.key});
 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body:

          //PageView manages the page transition,user can navigate to other pages by scrolling
          PageView(
        controller: pageController, // controlls page transition

        //update the currentIndexProvider so that selected icon in the bottom navigation bar also update
        onPageChanged: (value) =>
            ref.read(currentIndexProvider.notifier).state = value,
        children: const [
          HomeScreen(),
          ProfileScreen(),
        ],
      ),

      // Bottom navigation bar that allows switching between pages
      bottomNavigationBar: bottomNavigationViewModel(
        ref: ref,
        pageController: pageController,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //button to create new post
      floatingActionButton: floatingButton(
        onPressed: () => Navigator.pushNamed(context, '/AddPostScreen'),
      ),
    );
  }
}
