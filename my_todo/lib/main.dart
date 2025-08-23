// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_todo/widgets/colors.dart';
import 'package:my_todo/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My ToDo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primarySwatch: Colors.pink,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.white.withOpacity(0.5),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(
              Colors.white.withOpacity(0.3),
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: primaryColor,
          selectionColor: Colors.white.withOpacity(0.5),
          cursorColor: secondaryColor,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
