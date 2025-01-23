import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/providers/providers.dart';
import 'package:socialmediaapp/core/utils/navigation_helper.dart';
import 'package:socialmediaapp/views/bottom_navigation/widget/custom_bottombar.dart';

bottomNavigationViewModel(
    {required WidgetRef ref, required PageController pageController}) {
  int selectedIndex = ref.watch(currentIndexProvider);
  return Consumer(
    builder: (context, ref, child) {
      return customBottomBar(
          context: context,
          selectedIndex: selectedIndex,
          homeOnPressed: () {
            ref.read(currentIndexProvider.notifier).state = 0;
            onTabTapped(index: 0, pageController: pageController);
          },
          profileOnPressed: () {
            ref.read(currentIndexProvider.notifier).state = 1;
            onTabTapped(index: 1, pageController: pageController);
          });
    },
  );
}
