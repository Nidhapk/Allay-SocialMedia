import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkPressed;
  final VoidCallback onCancelPressed;
  final String okText;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onOkPressed,
    required this.onCancelPressed,
    required this.okText
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onCancelPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.red,
          ),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: onOkPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
          child: Text(okText),
        ),
      ],
    );
  }
}
