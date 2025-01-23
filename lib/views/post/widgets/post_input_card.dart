import 'package:flutter/material.dart';
import 'package:socialmediaapp/views/post/widgets/post_interaction_row.dart';
import 'package:socialmediaapp/views/post/widgets/postcontent_inputfield.dart';
import 'package:socialmediaapp/views/profile/widgets/sizedbox20.dart';

Widget postInputCard(
    {required BuildContext context,
    required void Function()? onAddImage,
    required void Function()? onTagFriends,
    required void Function()? onSubmitPost,
    required ImageProvider<Object>? backgroundImage,required TextEditingController descriptionController,required Widget buttonContent}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    padding: EdgeInsets.all(height * 0.02),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.withOpacity(0.4)),
      color: Colors.transparent,
    ),
    child: Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.withOpacity(0.1),backgroundImage:backgroundImage ,
            ), //displays the user profile
            SizedBox(
              width: width * 0.04,
            ),
            postContentInputField(descriptionController
            :descriptionController), //input field for the post discription
          ],
        ),
        Divider(
          color: Colors.grey.withOpacity(0.1),
          thickness: 1,
        ),
        sizedbox20(context: context),
        postInteractionRow(
          context: context,
          onAddImage: onAddImage, //to add image
          onTagFriends: onTagFriends, //to tag friends
          onSubmitPost: onSubmitPost,
          buttonContent: buttonContent
        ) //post submission button
      ],
    ),
  );
}
