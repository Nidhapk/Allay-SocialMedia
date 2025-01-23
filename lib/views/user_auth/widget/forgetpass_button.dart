import 'package:flutter/material.dart';
import 'package:socialmediaapp/core/constants/app_textstyles.dart';

Widget forgetPasswordButton(
    {required BuildContext context, required void Function()? onTap}) {
  final width = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      GestureDetector(
        onTap: onTap,
        child: Text(
          'ForgetPassword? ',
          style: AppTextStyles().textButtonStyle(width: width),
        ),
      )
    ],
  );
}
