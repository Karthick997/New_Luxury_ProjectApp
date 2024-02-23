import 'package:flutter/material.dart';
import 'package:luxury_project/UI_Screen/onboarding_screen.dart';

import 'UI_Screen/calender_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingScreen(),

    );
  }
}

