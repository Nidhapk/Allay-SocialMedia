import 'package:flutter/material.dart';
import 'package:socialmediaapp/views/profile/widgets/sizedbox20.dart';

Widget profileContainer({required BuildContext context,required String userName,required String email}) {
  final width = MediaQuery.of(context).size.width;

  return Row(
    children: [
      CircleAvatar(
        radius: width * 0.08,
        backgroundColor: Colors.grey.withOpacity(0.1),
      ),
      sizedbox20(context: context),
      Text.rich(
        TextSpan(
          text: '$userName\n',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: width * 0.04,
          ),
          children: [
            TextSpan(
              text: email,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: width * 0.03,
              ),
            )
          ],
        ),
      )
    ],
  );
}
