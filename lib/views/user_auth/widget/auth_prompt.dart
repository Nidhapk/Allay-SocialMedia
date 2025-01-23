import 'package:flutter/material.dart';
import 'package:socialmediaapp/core/constants/app_textstyles.dart';
import 'package:socialmediaapp/core/constants/colors.dart';
import 'package:socialmediaapp/views/home/widgets/sizedbox30.dart';

Widget authPrompt(
    {required BuildContext context,
    required void Function()? onTap,
    required String promptText,
    required String actionText}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return SizedBox(
    height: height * 0.11,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Divider(
          thickness: 0.5,
          color: AppColors().grey.withOpacity(0.5),
        ),
        sizedbox30(
          context: context,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              promptText,
              style: TextStyle(
                color: AppColors().grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                actionText,
                style: AppTextStyles().textButtonStyle(
                  width: width,
                ),
              ),
            )
          ],
        ),
        sizedbox30(
          context: context,
        )
      ],
    ),
  );
}
