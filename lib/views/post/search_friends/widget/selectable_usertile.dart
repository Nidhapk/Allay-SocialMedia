import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget selectableUserTile(
    {required BuildContext context,
    required String userName,
    required String emailId,
    //required void Function()? onTap,
   required void Function()? onTag, required IconData icon,}) {
  final width = MediaQuery.of(context).size.width;
  return ListTile(
   // onTap: onTap,
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
    trailing: GestureDetector(onTap:onTag ,
      child:  Icon(
      icon,
        size: 18,
      ),
    ),
  );
}
