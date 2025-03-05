import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar({
  required BuildContext context,
  required String text,
  Color? color,
  Color? textColor,
  IconData? icon,
  Duration? duration,
  bool? isBottomPadding,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(

      margin:isBottomPadding==true? const EdgeInsets.only(left:10,right:10,bottom:70):const EdgeInsets.all(10),
      shape: const StadiumBorder(),
      duration: duration ?? const Duration(milliseconds: 3000),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor ?? Colors.white),
            ),
          ),
          Icon(
            icon ?? Icons.error_outline,
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: color ?? Colors.blue.shade700,
    ),
  );
}