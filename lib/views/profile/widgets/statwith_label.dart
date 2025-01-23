import 'package:flutter/material.dart';

Widget stateWithLabel(
    {required BuildContext context,
    required String stat,
    required String label}) {
  final width = MediaQuery.of(context).size.width;
  return Text.rich(
    TextSpan(
      text: '$stat\n',
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: width * 0.05,
      ),
      children: [
        TextSpan(
          text: label,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: width * 0.03,
          ),
        )
      ],
    ),
  );
}
