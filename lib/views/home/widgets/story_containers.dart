import 'package:flutter/material.dart';

Widget storyContainer({
  required BuildContext context,
}) {
  final height = MediaQuery.of(context).size.height;
  return Container(
    height: height * 0.1,
    width: height * 0.1,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(
        0.1,
      ),
      shape: BoxShape.circle,
    ),
  );
}
