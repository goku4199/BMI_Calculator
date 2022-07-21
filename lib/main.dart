import 'dart:ffi';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget { //immutable
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),//To share colors and font styles throughout an app, use themes. You can either define app-wide themes, or use Theme widgets that define the colors and font styles for a particular part of the application.
      theme: ThemeData.dark().copyWith( //copyWith can add several features to ThemeData.dark()package

          primaryColor: Color(0xFF0A0E21),// add color to appbar and others
          appBarTheme: AppBarTheme(// background color of appbar
            backgroundColor: Color(0xFF0A0E21),
          ), // 0xFF is for full opaque.
          scaffoldBackgroundColor: Color(0xFF0A0E21),//scaffold background color
          //textTheme: TextTheme( // text background color
          //  bodyText1: TextStyle(color: Colors.white),
          //),
      ),
      home: InputPage(),
    );
  }
}


//https://docs.flutter.dev/cookbook/design/themes
//colorzilla 
//https://dribbble.com/shots/4585382-Simple-BMI-Calculator for getting custom colors
//seprating different screens into different files.
//to extract a widget go to flutter outline right click on a particular Widget and then extract it. and reuse it on different areas of your code.
//https://pub.dev/packages/font_awesome_flutter for icons
//
