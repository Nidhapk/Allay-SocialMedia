import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget verticalDividerK({required BuildContext context}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return SizedBox(
    height: width * 0.15,
    child: VerticalDivider(
      color: Colors.grey.withOpacity(0.2),
      width: width * 0.06, indent: height * 0.02, // Top padding
      endIndent: height * 0.02, thickness: 1,
    ),
  );
}
