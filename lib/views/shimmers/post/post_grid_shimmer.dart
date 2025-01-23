import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/views/shimmers/post/postcontainer_shimmer2.dart';

Widget postGridShimmer({required BuildContext context}) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return GridView.builder(
    padding: EdgeInsets.only(
        top: height * 0.05,
        left: width * 0.01,
        right: width * 0.01,
        bottom: height * 0.05),
    shrinkWrap: true,
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    itemCount: 7,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(
          left: width * 0.005,
          right: width * 0.005,
          bottom: width * 0.01,
        ),
        child: postContainerShimmer2(),
      );
    },
  );
}
