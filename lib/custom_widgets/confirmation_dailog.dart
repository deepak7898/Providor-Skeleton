import 'package:The_Book_Corporation/core/constant/colors.dart';
import 'package:The_Book_Corporation/custom_widgets/Custom_gap.dart';
import 'package:The_Book_Corporation/custom_widgets/custom_button.dart';
import 'package:The_Book_Corporation/custom_widgets/custom_text.dart';
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


void showCustomDialog({
  required BuildContext context,
  required String subjectName,

  required Widget? content,
  required void Function()? onPressed,
  Color? color,

}) {
  showDialog<String>(
    context: context,

    builder:
        (BuildContext context) => AlertDialog(
          backgroundColor:  primaryColor,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Add Publisher',
                fontSize: 15,
                getTextColor: Colors.white,
              ),
               CustomText(
                 fontSize: 15,
                 getTextColor: Colors.white,
                text: subjectName,
              ),
            ],
          ),
          const Divider(
            color: Colors.white,
          )
        ],
      ),
      content: content,
      actions: <Widget>[

        Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'Cancel'
                ,
                onTap: () {
                  Navigator.pop(context, 'Cancel');
                },
              ),
            ),
            const CustomWidthGap(),
            Expanded(
              child: CustomButton(
                text: 'Add',
                onTap: onPressed,
              ),
            )
          ],
        ),
        
      ],
    ),
  );
}