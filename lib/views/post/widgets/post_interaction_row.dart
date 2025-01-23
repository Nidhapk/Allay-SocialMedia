import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/views/post/widgets/circular_button.dart';
import 'package:socialmediaapp/views/profile/widgets/gradient_button.dart';

Widget postInteractionRow(
    {required BuildContext context,
    required void Function()? onAddImage,
    void Function()? onTagFriends,
    void Function()? onSubmitPost,required Widget buttonContent}) {
  final width = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      circularButton(
          context: context,
          image: 'assets/gallery.png',
          onTap: onAddImage), //to add image
      circularButton(
          context: context,
          image: 'assets/tag.png',
          onTap: onTagFriends), //to tag friends
      SizedBox(
        width: width * 0.3,
      ),
      SizedBox(
          height: 30,
          child: gradientButton(
            child:buttonContent ,
            onPressed: onSubmitPost,
          ) // share button to add post,
          )
    ],
  );
}
