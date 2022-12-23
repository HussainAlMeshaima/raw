import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;

class AppConstants {
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

class AppImages {
  static const String whiteLogo = 'assets/images/logo_white.png';
  static const String coloredLogo = 'assets/images/logo_colored.png';
  static const String address = 'assets/images/address.png';
  static const String helloEmoji = 'assets/images/hello_emoji.png';
  static const String photographyLogo = 'assets/images/photography.png';
  static const String videographyLogo = 'assets/images/videography.png';
  static const String studioLogo = 'assets/images/studio.png';
  static const String rentLogo = 'assets/images/rent.png';
  static const String customersLogo = 'assets/images/customers.png';
  static const String ratingLogo = 'assets/images/rating_star.png';
  static const String experienceLogo = 'assets/images/experience.png';
}

class AppSvgs {
  final SvgPicture svgWhiteLogo = SvgPicture.asset('assets/svgs/white_logo.svg');
  final SvgPicture svgColoredLogo = SvgPicture.asset('assets/svgs/color_logo.svg');
}
