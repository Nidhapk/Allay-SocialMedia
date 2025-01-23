import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget circularButton({required BuildContext context, required String image,void Function()? onTap}) {
  final width = MediaQuery.of(context).size.width;
  // final height = MediaQuery.of(context).size.height;
  return GestureDetector(onTap:onTap ,
    child: Container(
      padding: EdgeInsets.all(width * 0.015),
      height: width * 0.09,
      width: width * 0.09,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors().grey.withOpacity(
                0.4,
              ),
        ),
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        image,
      ),
    ),
  );
}
