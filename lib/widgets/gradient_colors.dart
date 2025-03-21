
import 'package:flutter/material.dart';

import '../core/constant/colors.dart';

Gradient? backgroundGradient =  LinearGradient(
  begin: Alignment.bottomCenter,  // Start from the top
  end: Alignment.topCenter, // End at the bottom
  colors: [
    primaryColor,
    primaryColor,
    primaryColorSecond,
    primaryColorLight,

  ],
);

Color? textColor =Colors.black87;
Color? whiteColor =Colors.white;