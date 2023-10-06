import 'package:flutter/material.dart';

class MyTheme {
  static Color primarylight = Color(0xff5D9CEC);
  static Color backgrundColor = Color(0xffDFECDB);
  static Color backgrundColorDark = Color(0xff60E1E);
  static Color whitecolor = Color(0xffFFFFFF);
  static Color blackcolor = Color(0xff383838);
  static Color graycolor = Color(0xffb0b0b0);
  static Color redcolor = Color(0xffEC4B4B);
  static Color blaccolordark = Color(0xff141922);
  static Color greenlight = Color(0xff61E757);

  static ThemeData LightMode = ThemeData(
      scaffoldBackgroundColor: backgrundColor,
      primaryColor: primarylight,
      appBarTheme: AppBarTheme(
          color: primarylight,
          toolbarHeight: 150.0,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: blackcolor,
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding:MaterialStateProperty.all(EdgeInsets.all(12))
          )
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: whitecolor,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: blackcolor,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: blackcolor,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        unselectedItemColor: graycolor,
        selectedItemColor: primarylight,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 20),
        unselectedLabelStyle: TextStyle(fontSize: 20),
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 30),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primarylight,
          shape: StadiumBorder(
              side: BorderSide(
                width: 4,
                color: whitecolor,
              ))));

  static ThemeData darkMode = ThemeData(
      scaffoldBackgroundColor: backgrundColorDark,
      primaryColor: primarylight,
      appBarTheme: AppBarTheme(
          color: primarylight,
          toolbarHeight: 150.0,
          centerTitle: false,
          iconTheme: IconThemeData(
            color: blackcolor,
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding:MaterialStateProperty.all(EdgeInsets.all(12))
          )
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: blaccolordark,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: blackcolor,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: blackcolor,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        unselectedItemColor: graycolor,
        selectedItemColor: primarylight,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontSize: 20),
        unselectedLabelStyle: TextStyle(fontSize: 20),
        selectedIconTheme: IconThemeData(size: 30),
        unselectedIconTheme: IconThemeData(size: 30),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primarylight,
          shape: StadiumBorder(
              side: BorderSide(
                width: 4,
                color: whitecolor,
              ))));
}
