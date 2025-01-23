import 'package:flutter/material.dart';
import 'package:socialmediaapp/views/bottom_navigation/widget/bottom_nav_icon.dart';

Widget customBottomBar(
    {required BuildContext context,
    required int selectedIndex,
    required void Function()? homeOnPressed,
    required void Function()? profileOnPressed}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(30), 
      topRight: Radius.circular(30),
    ),
    child: BottomAppBar(
      height: height * 0.08,
      shape: const CircularNotchedRectangle(), // Adds the notch for FAB
      color: Colors.white,
      notchMargin: 8.0, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Home Icon
          const SizedBox(
            width: 10,
          ),
          bottomNavigationIcon(
            icon: Icons.home_filled,
            context: context,
            selectedIndex: selectedIndex,
            index: 0,
            onPressed: homeOnPressed,
          ),
          // Profile Icon
          SizedBox(
            width: width * 0.3,
          ),
          bottomNavigationIcon(
            icon: Icons.person_2_rounded,
            context: context,
            selectedIndex: selectedIndex,
            index: 1,
            onPressed: profileOnPressed,
          ),

          const SizedBox(
            width: 10,
          )

        ],
      ),
    ),
  );
}
