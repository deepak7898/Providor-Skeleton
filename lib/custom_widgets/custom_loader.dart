
import 'package:The_Book_Corporation/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Custom_gap.dart';
import 'custom_text.dart';

Future<void> customLoader(BuildContext context) {
  Size size =MediaQuery.of(context).size;
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: primaryColor,
        shape: OutlineInputBorder(
          borderSide:  BorderSide(
            color:primaryColor
          ),
          borderRadius: BorderRadius.circular(4,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.fourRotatingDots(
             color: Colors.white,
              size:size.height*0.03 ,
            ),
            CustomGap(
              width: size.width*0.03,
            ),
            const CustomText(
              text: 'Please wait....',
              fontWeight: FontWeight.w500,
              getTextColor: Colors.white,
              fontSize: 20,
            )
          ],
        ),
      );
    },
  );
}
