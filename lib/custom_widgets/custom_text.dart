import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/theme/theme_controller.dart';



class CustomText extends StatelessWidget {
 final String? text;
 final double? fontSize;
 final bool? darkTheme;
 final double? wordSpacing;
 final double? textHeight;
 final FontWeight?fontWeight;
 final TextAlign? textAlign;
 final Color? textColor;
   const CustomText({
    this.text,
    this.textAlign,
    this.wordSpacing,
    this.fontSize,
    this.fontWeight,
    this.textHeight,
    this.textColor,
    this.darkTheme,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        text??'',
      textAlign: textAlign??TextAlign.center,
      // maxLines: 2,
      style: GoogleFonts.robotoFlex(
        textStyle:  TextStyle(
            height: textHeight,
            fontSize:fontSize?? 20 ,
            fontFamily: '',
            wordSpacing: wordSpacing,
            fontWeight:fontWeight?? FontWeight.w800,
            color:textColor??(darkTheme==true?LocalThemes.darkTextColor:LocalThemes.lightTextColor)
        ),
      ),

    );
  }
}
class CustomText1 extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final double? wordSpacing;
  final double? textHeight;
  final FontWeight?fontWeight;
  final TextAlign? textAlign;
  final Color? textColor;
  const CustomText1({
    this.text,
    this.textAlign,
    this.wordSpacing,
    this.fontSize,
    this.fontWeight,
    this.textHeight,
    this.textColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text??'',
      textAlign: textAlign??TextAlign.center,
      maxLines: 2,
      style: TextStyle(
          height: textHeight,
          fontSize: 20 ,
          fontFamily: '',
          overflow: TextOverflow.ellipsis,
          wordSpacing: wordSpacing,
          fontWeight:fontWeight?? FontWeight.w800,
          color:textColor ?? AppThemes.lightTheme(context).primaryColor
      ),

    );
  }
}
