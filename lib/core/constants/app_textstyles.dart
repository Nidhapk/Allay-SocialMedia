import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  final appNameStyle = GoogleFonts.pacifico(
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  textButtonStyle({required double width}) {
    return TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.w400,
        fontSize: width * 0.035);
  }

  final appBarTitleStyle = const TextStyle(fontWeight: FontWeight.w500);
}
