import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget gradientButton(
    {required Widget child, required void Function()? onPressed}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
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
