import 'package:flutter/material.dart';

showSnackbar(BuildContext, context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massage)));
}
