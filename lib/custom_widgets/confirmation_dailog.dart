import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String description,
  Color? color,
  required TextButton proceedButton,
  TextButton? cancelButton,
}) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: color ?? Colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          cancelButton ??
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
          proceedButton,
        ],
        content: Text(
          description,
          textAlign: TextAlign.center,
        ),
      );
    },
  );
}