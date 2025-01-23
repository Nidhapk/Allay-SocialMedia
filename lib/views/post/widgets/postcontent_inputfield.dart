import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget postContentInputField({required TextEditingController descriptionController}) {
  return Expanded(
    child: TextFormField(controller: descriptionController,
      decoration: const InputDecoration(
        //focusColor: Colors.blue,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:  Color.fromARGB(255, 125, 125, 125),
              width: 1), // Border color when focused
        ),
        enabledBorder: InputBorder.none,
        labelText: 'Write something here...',
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey, // Change label color on focus
        ),
      ),
    ),
  );
}
