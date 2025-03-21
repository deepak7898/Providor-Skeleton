import 'package:flutter/material.dart';

MaterialColor createMaterialColor(Color color) {
  Map<int, Color> swatch = {
    50: color.withOpacity(0.1),
    100: color.withOpacity(0.2),
    200: color.withOpacity(0.3),
    300: color.withOpacity(0.4),
    400: color.withOpacity(0.5),
    500: color.withOpacity(0.6),
    600: color.withOpacity(0.7),
    700: color.withOpacity(0.8),
    800: color.withOpacity(0.9),
    900: color.withOpacity(1.0),
  };
  return MaterialColor(color.value, swatch);
}
// const Color primaryColor = Color.fromARGB(255, 7, 89, 133);
//  Color primaryColor = const Color.fromARGB(255, 197, 186, 255);
 Color primaryColor = const Color.fromARGB(255, 85, 173, 155);
 Color primaryDarkColor = const Color.fromARGB(255, 68, 138, 124);
Color primaryColorSecond = const Color.fromARGB(255, 216, 239, 211);
Color primaryColorLight = const Color.fromARGB(255, 244, 250, 246);
Color primaryColorLightSecond =  const Color.fromARGB(255, 100, 200, 200);

const Color darkThemeApp = Colors.black87;
final Color secondaryColor = Colors.greenAccent.shade200;
