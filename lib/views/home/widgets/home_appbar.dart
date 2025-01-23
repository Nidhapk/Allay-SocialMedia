import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/core/constants/app_textstyles.dart';

PreferredSizeWidget homeAppBar(
    {required void Function()? onTap, required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    title: Padding(
      padding: EdgeInsets.all(width * 0.03),
      child: Text(
        'Allay',
        style: AppTextStyles().appNameStyle,
      ),
    ),
    actions: [
      GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.search,
          size: width * 0.07,
        ),
      ),
      SizedBox(
        width: width * 0.06,
      )
    ],
  );
}
