import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerBuilder({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  return ListView.builder(itemCount: 8,
    itemBuilder: (context, index) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListTile(
        leading: CircleAvatar(
          radius: width * 0.09,
        ),
        title: Container(
                            width: width*0.03,
                            height: 16,
                            color: Colors.white,
                          ),
        
        isThreeLine: true,
        subtitle:  Container(
                            width: width*0.07,
                            height: 16,
                            color: Colors.white,
                          ),
      ),
    );
  });
}
