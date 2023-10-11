import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void snackBarWidget(
  BuildContext context, {
  required String data,
  required String text,
}) {
  Clipboard.setData(ClipboardData(text: data)).then((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  });
}
