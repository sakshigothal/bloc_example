import 'package:flutter/material.dart';

enum AppTheme { lightTheme, darkTheme }

class AppThemes {
  static final appThemeData = {
    AppTheme.darkTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.white,foregroundColor: Colors.black),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white)
        )
      ),
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: Colors.white
        )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey,
        unselectedItemColor: Colors.white
      ),
      // accentColor: Colors.white,
      // accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.white,
    ),
    AppTheme.lightTheme: ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: const Color(0xFFE5E5E5),
      // accentColor: Colors.black,
      // accentIconTheme: IconThemeData(color: Colors.white),
      dividerColor: Colors.black,
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.black,foregroundColor: Colors.white),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)
          )
      ),
      textTheme: TextTheme(
          subtitle1: TextStyle(
              color: Colors.black
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black
      ),
    )
  };
}
