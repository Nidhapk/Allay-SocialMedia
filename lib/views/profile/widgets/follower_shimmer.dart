import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget followerShimmer({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Column(
      children: [
        Container(
          width: width * 0.1,
          height: height * 0.02,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          width: width * 0.1,
          height: height * 0.01,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
  );
}
