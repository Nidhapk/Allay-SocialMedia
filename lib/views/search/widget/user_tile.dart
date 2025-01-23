import 'package:flutter/material.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget userTile(
    {required BuildContext context,
    required String userName,
    required String emailId,required void Function()? onTap}) {
  final width = MediaQuery.of(context).size.width;
  return ListTile(onTap: onTap,
    leading: CircleAvatar(
      radius: width * 0.09,
    ),
    title: Text(
      userName,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
      ),
    ),
    isThreeLine: true,
    subtitle: Text(emailId),
    subtitleTextStyle: TextStyle(
      color: AppColors().grey,
      fontWeight: FontWeight.w400,
    ),
  );
}
