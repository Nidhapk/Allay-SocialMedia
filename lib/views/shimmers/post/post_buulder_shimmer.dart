import 'package:flutter/material.dart';
import 'package:socialmediaapp/views/shimmers/post/postcontainer_shimmer.dart';

Widget shimmerPostBuilder(
    ) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 9,
    itemBuilder: (context, index) {
      return shimmerPostContainer(context);
    },
  );
}
