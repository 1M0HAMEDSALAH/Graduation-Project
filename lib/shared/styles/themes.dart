import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kidscontrol/shared/styles/colors.dart';
ThemeData darkTheme =  ThemeData(
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    elevation: 0.0,
    titleTextStyle:  TextStyle(
      color:defaultColor,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color:defaultColor,
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor:defaultColor,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.white,
    elevation: 20.0,
    backgroundColor:Colors.black,
  ),


);
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0.0,
    titleTextStyle:  TextStyle(
      color:defaultColor,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color:defaultColor,
    ),
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor:defaultColor,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.white,
    elevation: 20.0,
    backgroundColor:Colors.white,
  ),


);


