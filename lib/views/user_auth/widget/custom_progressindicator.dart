import 'package:flutter/cupertino.dart';

Widget customProgressIndicator() {
  return const CupertinoActivityIndicator(
    radius: 15.0, // Adjust size
    animating: true, // Enable/disable animation
  );
}
