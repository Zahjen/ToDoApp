import 'package:flutter/material.dart';
import 'package:my_agenda/Models/Style/color.dart';

ThemeData themeGeneral = ThemeData(
  primarySwatch: Palette.colorApp, // General Color for the theme
  scaffoldBackgroundColor: Palette.colorApp[50], // General background color of the Scaffold
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Palette.colorApp[100], 
  ),
  colorScheme: ColorScheme.light(
    primary: Palette.colorApp, // Header backgroud color of dialog
    onPrimary: const Color(0xFF000000), // Header Text color of dialog
    onSurface: const Color(0xFFffffff), // Body Text color for the dialog Show Date Picker (stands for the number)
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Palette.colorApp[50], // Background color of dialog
    contentTextStyle: TextStyle(
      color: Palette.colorApp[100] // Text color of the Body 
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Rounded corners of the dialog
    ),
    titleTextStyle: TextStyle(
      color: Palette.colorApp[100], // Text color of the dialog title
      fontSize: 20.0 // Font size of the dialog title
    ),
  ),
  popupMenuTheme: PopupMenuThemeData(
    elevation: 10,  // Place shadow behind the popup
    color: Palette.colorApp[600], // Text color of the text
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Rounded corners of the dialog
    ),
  ),
  iconTheme: IconThemeData(
    color: Palette.colorApp, // Color of all icon
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Palette.colorApp // Color the line under the input
      )
    )
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Palette.colorApp[700],
    unselectedItemColor: Palette.colorApp[100],
    selectedIconTheme: IconThemeData(
      size: 33,
      color: Palette.colorApp
    ),
    showUnselectedLabels: false,
    showSelectedLabels: false,
  )
);
