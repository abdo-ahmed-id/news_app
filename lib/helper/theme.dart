import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        color: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          selectedIconTheme: IconThemeData(size: 30),
          elevation: 6),
      primarySwatch: Colors.blue,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      scaffoldBackgroundColor: Color(0xFF212121),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF212121),
          statusBarIconBrightness: Brightness.light,
        ),
        color: Color(0xFF212121),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF212121),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          selectedIconTheme: IconThemeData(size: 30),
          elevation: 6),
      primarySwatch: Colors.deepOrange,
    );
  }
}
