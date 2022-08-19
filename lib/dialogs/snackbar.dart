import 'package:flutter/material.dart';

snackBar(String text) {
  SnackBar(
    content: Text(text),
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {},
    ),
  );
}
