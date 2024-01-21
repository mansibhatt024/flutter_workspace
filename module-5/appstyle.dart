import 'package:flutter/material.dart';


import 'appcolors.dart';

class CustomStyle{
  static AppStyle({double fontSize = 16,Color color = primeColor,FontWeight fontWeight = FontWeight.w600}){
    TextStyle textStyle = TextStyle(color: color,fontSize: fontSize,fontWeight:fontWeight);
    return textStyle;
  }
}