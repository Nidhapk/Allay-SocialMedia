import 'package:flutter/material.dart';
import 'package:socialmediaapp/core/constants/colors.dart';

PreferredSizeWidget searchAppBar({required TextEditingController controller,required void Function(String)? onChanged}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false, // Removes the back button
    flexibleSpace: Padding(
      padding: const EdgeInsets.fromLTRB(16, 40, 16, 8), // Adjust padding
      child: TextFormField(controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: 'Search...',
          filled: true,
          fillColor: AppColors().scaffoldColor,
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),onChanged: onChanged,
      ),
    ),
  );
}
