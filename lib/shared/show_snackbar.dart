import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text('$message'),
    backgroundColor: Colors.teal,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
