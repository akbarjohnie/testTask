import 'package:flutter/material.dart';

// error snackbar

snackBar(String text, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.warning_amber_outlined,
            color: Colors.red,
            size: 25,
          ),
          const SizedBox(width: 10),
          // issue text
          Text(text),
        ],
      ),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ),
  );
}
