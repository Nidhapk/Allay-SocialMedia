import 'package:flutter/material.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget linearProgressIndicator({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  return SizedBox(
    width: width * 0.6,
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        AppColors().softBlue,
      ),
      minHeight: 5,
      semanticsLabel: 'Loading',
    ),
  );
}
