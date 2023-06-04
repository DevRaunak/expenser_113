import 'dart:ui';
import 'package:flutter/material.dart';

class AppColor{

  //Light Theme Colors
  static const secondaryColor = Color(0xffdbd9dd);
  //var bottomNavColor = Color(0xffdbdadb);
  static const appBlackColor = Color(0xff14101c);
  static const textColor = Color(0xff14101c);

  //Dark Theme Colors
  static const darkSecondaryColor = Color(0xffdbd9dd);
  //var bottomNavColor = Color(0xffdbdadb);
  static const darkAppBlackColor = Color(0xff14101c);
  static const darkTextColor = Color(0xff14101c);



}

class AppTheme{

  static ThemeData darkTheme(){
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
          displayLarge: mTextStyle43(mColor: Colors.white, mWeight: FontWeight.bold),
          titleLarge: mTextStyle34(mColor: Colors.white, mWeight: FontWeight.bold),
          titleMedium: mTextStyle16(mColor: Colors.white),
          titleSmall: mTextStyle12(mColor: Colors.white)
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(
              color: Colors.white
          )
      ),
    );
  }
  static ThemeData lightTheme(){
    return ThemeData(
        brightness: Brightness.light,
        textTheme: TextTheme(
            displayLarge: mTextStyle43(mColor: Colors.white, mWeight: FontWeight.bold),
            titleLarge: mTextStyle34(mColor: Colors.white, mWeight: FontWeight.bold),
            titleMedium: mTextStyle16(mColor: Colors.white),
            titleSmall: mTextStyle12(mColor: Colors.white)
        ),
        scaffoldBackgroundColor: Colors.blue,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blueGrey,
            iconTheme: IconThemeData(
                color: Colors.white
            )
        )
    );
  }

}

Widget widthSpacer({double mWidth = 11.0}){
  return SizedBox(width: mWidth,);
}

Widget heightSpacer({double mHeight = 11.0}){
  return SizedBox(height: mHeight,);
}

InputDecoration fieldDecoration({
  required String hint,
  required String labelText,
  Color filledColor = AppColor.secondaryColor,
  IconData? prefixIcon,
  IconData? suffixIcon,
  bool isPasswordField = false
}){
  return InputDecoration(
    filled: true,
    fillColor: filledColor,
    hintText: hint,
    label: Text(labelText),
    prefixIcon: prefixIcon!=null ? Icon(prefixIcon) : null,
    suffixIcon: suffixIcon!=null ? Icon(suffixIcon) : null,
    enabledBorder: getBorder(),
    focusedBorder: getBorder(borderColor: AppColor.appBlackColor, borderWidth: 2)
  );
}

OutlineInputBorder getBorder({
  double radius=21,
  Color borderColor = Colors.white,
  double borderWidth = 1
}){
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
          color: borderColor,
          width: borderWidth
      )
  );
}

TextStyle mTextStyle43({
  Color mColor = AppColor.textColor,
  FontWeight mWeight = FontWeight.normal
}){
  return TextStyle(
    fontSize: 43,
    color: mColor,
    fontWeight: mWeight,
    fontFamily: 'Poppins'
  );
}

TextStyle mTextStyle34({
  Color mColor = AppColor.textColor,
  FontWeight mWeight = FontWeight.normal
}){
  return TextStyle(
      fontSize: 34,
      color: mColor,
      fontWeight: mWeight,
      fontFamily: 'Poppins'
  );
}

TextStyle mTextStyle25({
  Color mColor = AppColor.textColor,
  FontWeight mWeight = FontWeight.normal
}){
  return TextStyle(
      fontSize: 25,
      color: mColor,
      fontWeight: mWeight,
      fontFamily: 'Poppins'
  );
}

TextStyle mTextStyle21({
  Color mColor = AppColor.textColor,
  FontWeight mWeight = FontWeight.normal
}){
  return TextStyle(
      fontSize: 21,
      color: mColor,
      fontWeight: mWeight,
      fontFamily: 'Poppins'
  );
}

TextStyle mTextStyle16({
  Color mColor = AppColor.textColor,
  FontWeight mWeight = FontWeight.normal
}){
  return TextStyle(
      fontSize: 16,
      color: mColor,
      fontWeight: mWeight,
      fontFamily: 'Poppins'
  );
}

TextStyle mTextStyle14({
  Color mColor = AppColor.textColor,
  FontWeight mWeight = FontWeight.normal
}){
  return TextStyle(
      fontSize: 14,
      color: mColor,
      fontWeight: mWeight,
      fontFamily: 'Poppins'
  );
}

TextStyle mTextStyle12({
  Color mColor = AppColor.textColor,
  FontWeight mWeight = FontWeight.normal
}){
  return TextStyle(
      fontSize: 12,
      color: mColor,
      fontWeight: mWeight,
      fontFamily: 'Poppins'
  );
}