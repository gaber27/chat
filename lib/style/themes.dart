import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


ThemeData darkTheme =ThemeData(
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.grey,
    // floatingActionButtonTheme: FloatingActionButtonThemeData(
    //   backgroundColor: defaultColor,
    // ),
    // بيمشي علي الابليكشن كله
    appBarTheme: AppBarTheme(
        titleSpacing: 20.0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor:  Colors.deepPurple,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Colors.deepPurple,
          statusBarIconBrightness: Brightness.light,
        )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor:  Colors.deepPurple,
        elevation: 20.0,
        backgroundColor:  Colors.grey,
        unselectedItemColor: Colors.white
    ),
    textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),

    ),

);
ThemeData ligthTheme = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: defaultColor,
  // ),
  // بيمشي علي الابليكشن كله
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.blue,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      // backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.dark,
      )

  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      elevation: 20.0,
      backgroundColor:Colors.white,
      unselectedItemColor: Colors.grey
    // backgroundColor: Colors.black,
    // unselectedItemColor: Colors.black
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      )
  ),
  fontFamily: 'Yagora'

);