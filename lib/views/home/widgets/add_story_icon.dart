import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget addStoryIcon({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    height: width * 0.1,
    width: height * 0.1,
    decoration: BoxDecoration(
        border: Border.all(
          color: AppColors().softBlue.withOpacity(0.6),
        ),
        gradient: LinearGradient(
          colors: [
            AppColors().softBlue.withOpacity(0.1),
            AppColors().lightMagenta.withOpacity(0.1)
          ],
        ),
        shape: BoxShape.circle),
    child: Icon(
      color: AppColors().softBlue.withOpacity(0.6),
      Icons.add,
      size: height * 0.04,
    ),
  );
}
