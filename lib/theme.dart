import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: grey,
    listTileTheme: ListTileThemeData(
      tileColor: Colors.amber,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    cardTheme: CardTheme(
        color: grey,
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    textTheme: TextTheme(
        bodyMedium: TextStyle(color: Colors.black, fontSize: 24),
        titleSmall: TextStyle(color: grey, fontSize: 22)),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle:
                MaterialStateProperty.all(TextStyle(color: grey, fontSize: 22)),
            backgroundColor: MaterialStateProperty.all(purple),
            overlayColor: MaterialStateProperty.all(focusPurple),
            maximumSize: MaterialStateProperty.all(const Size(200, 80)),
            minimumSize: MaterialStateProperty.all(const Size(150, 50)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))))),
    appBarTheme: const AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 22)));

Color purple = const Color(0xFF7947fb);
Color grey = const Color(0xFFf1f2fd);
Color focusPurple = const Color(0xFF540aac);
