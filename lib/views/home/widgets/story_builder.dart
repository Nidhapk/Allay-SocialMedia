import 'package:flutter/material.dart';
import 'package:socialmediaapp/views/home/widgets/add_story_icon.dart';
import 'package:socialmediaapp/views/home/widgets/story_containers.dart';

Widget storyBuilder({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Container(
    height: height * 0.1,
    width: width,
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(color: Colors.grey),
      ],
      color: Colors.white,
    ),
    child: ListView.builder(
      padding: EdgeInsets.only(
        // left: width * 0.01,
        top: height * 0.018,
        bottom: height * 0.018,
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return index == 0
            ? addStoryIcon(context: context)
            : storyContainer(context: context);
      },
    ),
  );
}
