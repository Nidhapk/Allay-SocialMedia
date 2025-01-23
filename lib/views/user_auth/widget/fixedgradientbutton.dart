import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget fixedLenghtButton(
    {required BuildContext context,
    required void Function()? onPressed,
    required Widget child}) {
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width * 0.9,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      boxShadow: const [
        BoxShadow(
          color: Colors.white,
        )
      ],
      gradient: LinearGradient(
        colors: [
          AppColors().violet,
          AppColors().softBlue,
          const Color.fromARGB(255, 122, 187, 240),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: child,
    ),
  );
}
