import 'package:flutter/material.dart';

Widget postContainer2({required image,required void Function()? onTap}) {
  return GestureDetector(onTap:onTap ,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(image)),
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
