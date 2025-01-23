import 'package:flutter/material.dart';

void onTabTapped({
  required int index,
  required PageController pageController,
}) {
  pageController.jumpToPage(index); // Navigate to the corresponding page
}
