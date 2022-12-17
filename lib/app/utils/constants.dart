import 'package:flutter/material.dart';

class Constants {
  /// static const String DOG = 'dog';
}

class AppColors {
  Color backgroundColor = const Color(0xffFFFFFF);
  Color primary = const Color(0xff14213D);
  Color secondary = const Color(0xffFCA311);
  Color accent = const Color(0xffE5E5E5);
  Color textField = const Color(0xffF0F0F0);
  Color textColor = const Color(0xff000000);
}

class AppTextSize {
  double large = 40;
  double medium = 20;
  double small = 14;
}

class AppThemes {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors().primary,
    appBarTheme: AppBarTheme(backgroundColor: AppColors().primary),
  );

  ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
