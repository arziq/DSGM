import 'package:flutter/material.dart';

MaterialColor myColor = const MaterialColor(
  0xff065A72,
  <int, Color>{
    50: Color(0xff065A72),
    100: Color(0xff065A72),
    200: Color(0xff065A72),
    300: Color(0xff065A72),
    400: Color(0xff065A72),
    500: Color(0xff065A72),
    600: Color(0xff065A72),
    700: Color(0xff065A72),
    800: Color(0xff065A72),
    900: Color(0xff065A72),
  },
);
ThemeData theme = ThemeData(
    primaryTextTheme: const TextTheme(
      headline4: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    fontFamily: 'Poppins',
    primaryColor: MyColors.primaryColor,
    scaffoldBackgroundColor: MyColors.backgroundColor,
    hoverColor: MyColors.hover,
    unselectedWidgetColor: MyColors.primaryColor,
    iconTheme: const IconThemeData(color: MyColors.primaryColor),
    buttonTheme: const ButtonThemeData(
      buttonColor: MyColors.primaryColor,
    ),
    appBarTheme: const AppBarTheme(
      color: MyColors.backgroundColor,
      iconTheme: IconThemeData(color: MyColors.primaryColor),
      actionsIconTheme: IconThemeData(color: MyColors.primaryColor),
      elevation: 0,
      titleTextStyle: TextStyle(
        color: MyColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: MyColors.backgroundColor,
      hintStyle: MyTextStyles.hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
            color: MyColors.primaryColor, style: BorderStyle.solid, width: 1),
        borderRadius: BorderRadius.all(MyShapes.radiusCircular),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(MyShapes.radiusCircular)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            textStyle: MyTextStyles.button,
            shape: RoundedRectangleBorder(
                borderRadius: MyShapes.circularBorders))),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: MyColors.primaryColor,
      padding: EdgeInsets.zero,
      textStyle: MyTextStyles.button,
    )),
    cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: MyShapes.cardBorders),
        color: MyColors.containerColor1),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: myColor)
        .copyWith(secondary: MyColors.greenColor));

class MyColors {
  static const Color backgroundColor = Colors.white;
  static const Color greyColor = Color(0xffA5A5A5);
  static const Color greenColor = Color(0xffC3F1AE);
  static const Color redColor = Color(0xffF4B1B1);
  static const Color yellowColor = Color(0xffF4EEB1);
  static const Color primaryColor = Color(0xff12175a);
  static const Color secondaryColor = Color(0xff37C5FF);
  static Color containerColor1 = const Color(0xff15746C);
  static const Color containerColor2 = Color(0xFFEBEBEB);
  static const Color containerColor3 = Color(0xFFF5733B);
  static const Color containerColor4 = Color(0xFFF5F5F5);

  static const fontColor1 = Color(0xff2E2E2E);
  static const fontColor2 = Color(0xff12175D);
  static const fontColor3 = Color(0xffFAFAFA);
  static const fontColorError = Color(0xffEF5945);
  static const hintTextColor = Color(0xffA5A5A5);
  static const hover = Color(0xffff9100);
  static const iconColor = primaryColor;
}

class MyTextStyles {
  static const TextStyle hintText = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.italic,
      fontSize: 16,
      color: MyColors.hintTextColor);

  static const TextStyle headline1 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 23,
      letterSpacing: 0,
      color: MyColors.fontColor1);
  static const TextStyle headline2 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 19,
      letterSpacing: 0.15,
      color: MyColors.fontColor1);
  static const TextStyle subtitle1 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      fontSize: 15,
      letterSpacing: 0.15,
      color: MyColors.fontColor1);

  static const TextStyle subtitle2 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      fontSize: 13,
      color: MyColors.fontColor1);

  static const TextStyle body1 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: 15,
      letterSpacing: 0.5,
      color: MyColors.fontColor1);
  static const TextStyle body2 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      letterSpacing: 0.25,
      fontSize: 13,
      color: MyColors.fontColor1);
  static const TextStyle caption1 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      letterSpacing: 0.4,
      fontSize: 12,
      color: MyColors.fontColor3);
  static const TextStyle caption2 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontSize: 10,
      color: MyColors.fontColor1);
  static const TextStyle button = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      fontSize: 13,
      color: MyColors.fontColor1);

  static const TextStyle smallText1 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      letterSpacing: 0.15,
      fontSize: 8,
      color: MyColors.fontColor1);
  static const TextStyle smallText2 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      letterSpacing: 0.15,
      fontSize: 6,
      color: MyColors.fontColor1);
  static const TextStyle overline = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.normal,
      letterSpacing: 1.5,
      fontSize: 10,
      color: MyColors.fontColor1);

  static const TextStyle link1 = TextStyle(
      fontFamily: 'Poppins',
      fontStyle: FontStyle.italic,
      fontSize: 14,
      color: MyColors.primaryColor);
}

class MyShapes {
  static BorderRadiusGeometry checkboxBorders = BorderRadius.circular(5.0);
  static BorderRadiusGeometry circularBorders = BorderRadius.circular(2.0);
  static Radius radiusCircular = const Radius.circular(2.0);
  static BorderRadiusGeometry cardBorders = BorderRadius.zero;
  static BorderRadius circularBordersClipRRect = BorderRadius.circular(4);
}

class MySizes {
  static double minimumHeightInput = 40;
}
