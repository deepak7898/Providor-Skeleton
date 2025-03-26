import 'package:flutter/material.dart';

import '../widgets/gradient_colors.dart';

class CustomCircularIcon  extends StatelessWidget {
final  IconData? icon;
 final Color? backgroundColor;
  const CustomCircularIcon ({super.key,this.backgroundColor,this.icon});

  @override
  Widget build(BuildContext context) {
    return    CircleAvatar(
      backgroundColor: backgroundColor,
      minRadius: 5,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Icon(icon,color: whiteColor,size: 16,),
      ),
    );
  }
}
