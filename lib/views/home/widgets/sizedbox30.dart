import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget sizedbox30({required BuildContext context}) {
  final height = MediaQuery.of(context).size.height;

  return  SizedBox(
    height:height*0.03,
  );
}
