// @dart=2.9
import 'package:flutter/material.dart';
import 'customColors.dart';

class CustomTheme {
  // Retreiving class field and saving it in a variable

  static ThemeData get lightTheme {
    // Converting Color to MaterialColor
    

    return ThemeData(

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(200)),
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          padding: const EdgeInsets.fromLTRB(30, 12, 30, 12)
        )
      ),
      
      // Color Theme
      colorScheme: const ColorScheme.light(
        primary: CustomColors.bluebell,
        secondary: CustomColors.grey2
      ),
      scaffoldBackgroundColor: Colors.white,

      // Text Theme
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        headline1: TextStyle(fontSize: 26, fontWeight: FontWeight.w800, color: Colors.black),
        headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: CustomColors.grey1),
        subtitle1: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
        subtitle2: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black)),
        
      

      // Fonts
      fontFamily: "Circular",
    );
  }
}
