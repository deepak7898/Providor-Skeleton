
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../core/constant/colors.dart';
import '../services/theme/theme_controller.dart';




class CustomTextFormField extends StatefulWidget {

  final String? hintText;
  final bool? obscureText;

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final Color? borderColor ;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? readOnly;
  final Color? shadowColor;
  final int? maxLines ;
  final Color? hintTextColor;
  final FocusNode? focusNode;
  final void Function()? iconOnPressed;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {super.key,
        this.hintText,
        this.prefixIcon,
        this.shadowColor,
        this.suffixIcon,
        this.obscureText,
        this.maxLength,
        this.maxLines,

        this.borderColor,
        this.controller,
        this.focusNode,
        this.readOnly = false,
        this.keyboardType,
        this.onChanged,
        this.hintTextColor,
        this.onTap,
        this.validator,
        this.onEditingComplete,
        this.iconOnPressed});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height:size.height*0.06,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(color:primaryColor, width: 1),
          boxShadow: [

            BoxShadow(
                color:widget.shadowColor?? Colors.grey.withOpacity(0.5),
                blurRadius: 4,
                spreadRadius: 1,
                offset: const Offset(0, 1)),
          ]

      ),
      child: TextFormField(
        controller:widget.controller,

        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^[\x00-\x7F]+$')),
        ],
        maxLines: widget.maxLines,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType,
        readOnly:widget.readOnly??false,
        maxLength:widget.maxLength ,
        onChanged:widget.onChanged ,
        onTap:widget.onTap,
        obscuringCharacter: '*',
        validator: widget.validator,
        cursorColor:LocalThemes.lightTextColor,
        style:  TextStyle(color: LocalThemes.lightTextColor,fontSize:widget.obscureText==true?20 :17,fontWeight: FontWeight.w400,letterSpacing:widget.obscureText==true ?4:0),
        decoration: InputDecoration(
            counterText: '',

            contentPadding: const EdgeInsets.only(top: 10),
            hintText: widget.hintText,
            prefixIcon: Icon(
              widget.prefixIcon,
              color: AppThemes.lightTheme(context).primaryColor,
              size: size.height * 0.024,
            ),
            suffixIcon: IconButton(
              onPressed: widget.iconOnPressed,
              icon: Icon(
                widget.suffixIcon,
                color:AppThemes.lightTheme(context).primaryColor,
                size: size.height * 0.024,
              ),
            ),
            hintStyle:  TextStyle(
                color:LocalThemes.lightTextColor,
                fontFamily: '',
                fontWeight: FontWeight.w300,
                letterSpacing: 0,
                fontSize: 15),
            border: InputBorder.none),
      ),
    );
  }
}

class CustomTextFormField2 extends StatefulWidget {
  final String? hintText;
  final bool? obscureText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final void Function()? iconOnPressed;
  const CustomTextFormField2(
      {super.key,
        this.hintText,
        this.prefixIcon,
        this.suffixIcon,
        this.obscureText,
        this.readOnly = false,
        this.keyboardType,
        this.iconOnPressed});

  @override
  State<CustomTextFormField2> createState() => _CustomTextFormField2State();
}

class _CustomTextFormField2State extends State<CustomTextFormField2> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height:size.height*0.06,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppThemes.lightTheme(context).primaryColor, width: 1),
          boxShadow: [
            BoxShadow(
                color: Colors.blue.shade700,
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(1, 1)),
          ]
      ),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType,
        readOnly:widget.readOnly??false,
        style:  TextStyle(color: AppThemes.lightTheme(context).primaryColor,fontSize: 14),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 10,left: 10),
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: widget.iconOnPressed,
              icon: Icon(
                widget.suffixIcon,
                color: AppThemes.lightTheme(context).primaryColor,
                size: size.height * 0.024,
              ),
            ),
            hintStyle: const TextStyle(
                color: Colors.black54,
                fontFamily: '',
                fontWeight: FontWeight.w500,
                fontSize: 13),
            border: InputBorder.none),
      ),
    );
  }
}



