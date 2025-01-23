import 'package:flutter/material.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget floatingButton({required void Function()? onPressed }) {
  return FloatingActionButton(
    shape: const CircleBorder(),
    onPressed: onPressed,
    //backgroundColor: Colors.red,
    child: Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors().softBlue,
            
            AppColors().lightMagenta,
          ], 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: const Icon(
        Icons.add,
        size: 28,
        color: Colors.white,
      ),
    ),
  );
}
