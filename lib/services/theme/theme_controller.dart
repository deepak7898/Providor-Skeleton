import 'package:flutter/material.dart';

import '../../core/constant/colors.dart';



class AppThemes {
  ///1) Light Theme...

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      canvasColor: Colors.transparent,
      dividerTheme: DividerThemeData(color: Colors.grey.shade200),

      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: createMaterialColor(primaryColor),
      ),

     bottomSheetTheme: const BottomSheetThemeData(
       backgroundColor: Colors.transparent,

     ),

      appBarTheme: const AppBarTheme(
        elevation: 1,
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      scaffoldBackgroundColor:primaryColor,
      iconTheme: IconThemeData(color: Colors.grey.shade700),
    );
  }
  static ThemeData darkTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: darkThemeApp,
      canvasColor: Colors.transparent,
      dividerTheme: DividerThemeData(color: Colors.grey.shade200),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: createMaterialColor(darkThemeApp),
      ),

     bottomSheetTheme: const BottomSheetThemeData(
       backgroundColor: Colors.transparent
     ),

      appBarTheme: const AppBarTheme(
        elevation: 1,
        backgroundColor: darkThemeApp,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      scaffoldBackgroundColor:darkThemeApp,
      iconTheme: IconThemeData(color: Colors.grey.shade700),
    );
  }
}


class LocalThemes{

  static Color darkThemeButtonContainerColor = Colors.green.shade600;
  static Color lightTextColor = Colors.black87;
  static Color darkTextColor = Colors.white;
}