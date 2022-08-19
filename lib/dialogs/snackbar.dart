import 'package:flutter/material.dart';

snackBar(String text, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            Icons.warning_amber_outlined,
            color: Colors.red,
            size: 25,
          ),
          Text('Enter some city'),
        ],
      ),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ),
  );
}
