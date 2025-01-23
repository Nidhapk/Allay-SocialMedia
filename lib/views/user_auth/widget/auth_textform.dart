import 'package:flutter/material.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

Widget authTextForm(
    {required BuildContext context,
    required TextEditingController controller,
    String? Function(String?)? validator,
    required String labelText}) {
  final width = MediaQuery.of(context).size.width;
  return TextFormField(
    controller: controller,
    validator: validator,
    cursorColor: AppColors().softBlue,
    cursorErrorColor: Colors.red,
    decoration: InputDecoration(
      isDense: true,
      labelText: labelText,
      labelStyle: TextStyle(
          color: AppColors().grey,
          fontSize: width * 0.037,
          fontWeight: FontWeight.w500),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          width: 1.3,
          color: AppColors().grey.withOpacity(0.5),
        ), // Default border color
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: AppColors().softBlue,
        ), // Focus color
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.red,
        ), // Error color
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.red,
        ), // Error color when focused
      ),
    ),
  );
}
