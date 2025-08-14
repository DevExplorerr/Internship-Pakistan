// ignore_for_file: deprecated_member_use

import 'package:daily_expense_tracker/screens/splash_screen.dart';
import 'package:daily_expense_tracker/widgets/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily Expense Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(whiteColor),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(
              Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: primaryColor,
          selectionColor: secondarytextColor,
          cursorColor: secondarytextColor,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
