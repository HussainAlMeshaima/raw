import 'package:flutter/material.dart';

class Constants {
  /// static const String DOG = 'dog';
}

class AppColors {
  Color backgroundColor = const Color(0xffFFFFFF);
  Color primary = const Color(0xffFFD683);
  Color textField = const Color(0xffF0F0F0);
  Color textColor = const Color(0xff59344F);
}

class AppThemes {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors().primary,
    appBarTheme: AppBarTheme(backgroundColor: AppColors().primary),
  );

  ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
