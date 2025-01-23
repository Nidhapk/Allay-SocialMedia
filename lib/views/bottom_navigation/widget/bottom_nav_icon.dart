import 'package:flutter/material.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget bottomNavigationIcon(
    {required BuildContext context, required int selectedIndex,required int index,
    required void Function()? onPressed,required  IconData? icon, }) {
  final width = MediaQuery.of(context).size.width;
  return IconButton(
    icon:  Icon(icon),
    iconSize: index == selectedIndex ? width * 0.08 : width * 0.06,
    color: index == selectedIndex ? AppColors().softBlue : Colors.grey,
    onPressed: onPressed
  );
}
