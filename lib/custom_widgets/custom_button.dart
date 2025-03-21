import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'custom_text.dart';

class CustomButton extends StatefulWidget {
  final Widget? child;
  final String? text;
  final bool? showIcon;
  final bool? withOutColor;

  final double? textFontSize;
  final double? rightIconSize;
  final IconData? rightIcon;
  final Color? buttonTextColor;
  final Color? containerColor;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  const CustomButton(
      {super.key,
      this.child,
      this.text,
      this.rightIcon,
      this.rightIconSize,
      this.showIcon = false,
      this.withOutColor = false,
      this.onTap,
      this.containerColor,
      this.buttonTextColor,
      this.textFontSize,
      this.padding});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color myColor1 = const Color.fromARGB(255, 216, 239, 211);
  Color myColor2 = const Color.fromARGB(255, 85, 173, 155);
  Color buttonColor =  const Color(0xFFE0E0E0);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            color:widget.containerColor?? Colors.black45,

            boxShadow: const [
              BoxShadow(
                  color:   Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 1)
            ]),
        child: Padding(
          padding: widget.padding ??
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: widget.text,
                getTextColor: Colors.white,
                fontSize: widget.textFontSize ?? 17,
                fontWeight: FontWeight.w800,
              ),
              if (widget.showIcon == true)
                Icon(
                  widget.rightIcon ?? MaterialIcons.arrow_right_alt,
                  color: Colors.white,
                  size: widget.rightIconSize,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtonSec extends StatefulWidget {
  final String? text;
  final bool? showIcon;
  final bool? withOutColor;
  final double? textFontSize;
  final EdgeInsetsGeometry? padding;
  final void Function()? onTap;
  const CustomButtonSec(
      {super.key,
      this.text,
      this.showIcon = false,
      this.withOutColor = false,
      this.onTap,
      this.textFontSize,
      this.padding});

  @override
  State<CustomButtonSec> createState() => _CustomButtonSecState();
}

class _CustomButtonSecState extends State<CustomButtonSec> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.only(left: 15, right: 15),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          // decoration:BoxDecoration(
          //     borderRadius: const BorderRadius.all(Radius.circular(5)),
          //     gradient: LinearGradient(colors: [
          //       Colors.blue.shade800,
          //       Colors.blue.shade400,
          //       Colors.blue.shade200
          //     ]),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.blue.shade700,
          //         blurRadius: 1,
          //         // spreadRadius: 1,
          //         // offset: Offset(1,1)
          //       ),
          //
          //     ]
          // ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blue.shade800,
                Colors.blue.shade600,
                Colors.blue.shade800
              ]),
              borderRadius: BorderRadius.circular(7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey
                      .withOpacity(0.5), // Adjust opacity for a softer shadow
                  blurRadius:
                      4.0, // Increase blurRadius for a more diffused shadow
                  spreadRadius: 1.0, // Adjust spreadRadius for shadow size
                  offset:
                      const Offset(0, 2), // Offset in the downward direction
                ),
              ]),

          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: widget.text,
                  getTextColor: widget.withOutColor == true
                      ? Colors.black54
                      : Colors.white,
                  fontSize: widget.textFontSize ?? 20,
                  fontWeight: FontWeight.w800,
                ),
                if (widget.showIcon == true)
                  const Icon(
                    MaterialIcons.arrow_right_alt,
                    color: Colors.white,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final bool? showIcon;
  final bool? showRightIcon;
  final bool? withOutColor;
  final double? textFontSize;
  final EdgeInsetsGeometry? padding;
  const CustomButton2(
      {super.key,
      this.onTap,
      this.text,
      this.textFontSize,
      this.padding,
      this.showIcon,
      this.withOutColor,
      this.showRightIcon = false});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height * 0.05,
          width: size.width * 0.3,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              // color: Colors.white,
              gradient: LinearGradient(colors: [
                Colors.blue.shade800,
                Colors.blue.shade600,
                Colors.blue.shade800
              ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade700,
                  blurRadius: 1,
                  // spreadRadius: 1,
                  // offset: Offset(1,1)
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showRightIcon == true)
                const Icon(
                  Entypo.chevron_small_left,
                  color: Colors.white,
                ),
              CustomText(
                text: text,
                getTextColor: Colors.white,
                fontSize: textFontSize ?? 20,
                fontWeight: FontWeight.w800,
              ),
              if (showIcon == true)
                const Icon(
                  Entypo.chevron_small_right,
                  color: Colors.white,
                )
            ],
          ),
        ),
      ),
    );
  }
}
