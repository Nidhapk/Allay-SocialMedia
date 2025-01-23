import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget postContainerShimmer2() {
 return  Shimmer.fromColors(
   baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
   child: Container(
        decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
    )),
 );
}
