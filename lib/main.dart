import 'package:bmi_calc_animatad/views/screens/BMIPage.dart';
import 'package:bmi_calc_animatad/views/screens/Home_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Splash(),
        'Home':(context) => home(),
      },
    )
  );
}