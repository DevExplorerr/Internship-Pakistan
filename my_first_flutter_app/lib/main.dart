// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/colors.dart';
import 'package:my_first_flutter_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First Flutter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionColor: blackColor.withOpacity(0.3),
          selectionHandleColor: blackColor,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
