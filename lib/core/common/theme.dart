import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final Color _iconColor = Colors.amber.shade900;
  static const Color _lightPrimaryColor = Color(0xFF546E7A);
  static const Color _lightPrimaryVariantColor = Color(0xFF394F53);
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.white;

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: _darkSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 26),
        color: _lightPrimaryVariantColor,
        iconTheme: IconThemeData(color: _lightOnPrimaryColor),
      ),
      fontFamily: 'Montserrat',
      colorScheme: const ColorScheme.light(
        primary: _lightPrimaryColor,
        secondary: _lightSecondaryColor,
        onPrimary: _lightOnPrimaryColor,
      ),
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
      textTheme: _lightTextTheme,
      dividerTheme: const DividerThemeData(color: Colors.black12));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryVariantColor,
      appBarTheme: const AppBarTheme(
        color: _darkPrimaryVariantColor,
        iconTheme: IconThemeData(color: _darkOnPrimaryColor),
      ),
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _darkSecondaryColor,
        onPrimary: _darkOnPrimaryColor,
        background: Colors.white12,
      ),
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
      textTheme: _darkTextTheme,
      dividerTheme: const DividerThemeData(color: Colors.black));

  static const TextTheme _lightTextTheme = TextTheme(
      displayLarge: _lightScreenHeading1TextStyle,
      titleLarge: _lightTitleTextStyle);

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkScreenHeading1TextStyle,
  );

  static const TextStyle _lightScreenHeading1TextStyle = TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: _lightOnPrimaryColor,
      fontFamily: "Roboto");

  static const TextStyle _lightTitleTextStyle = TextStyle(
    color: _lightOnPrimaryColor,
  );

  static final TextStyle _darkScreenHeading1TextStyle =
      _lightScreenHeading1TextStyle.copyWith(color: _darkOnPrimaryColor);

  static _getSearchBarTheme([bool isLight = true]) {
    final ThemeData theme = isLight ? lightTheme : darkTheme;

    return theme.copyWith(
        appBarTheme: theme.appBarTheme.copyWith(elevation: 0),
        textTheme: theme.textTheme.copyWith(
          titleLarge: theme.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: TextStyle(
              color: theme
                  .colorScheme.onPrimary, // set your desired hint color here
            )));
  }

  static final ThemeData searchBarLightTheme = _getSearchBarTheme();
  static final ThemeData searchBarDarkTheme = _getSearchBarTheme(false);
}
