// ignore_for_file: deprecated_member_use

import 'package:cookify/provider/favorite_provider.dart';
import 'package:cookify/screens/splash_screen.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  FavoritesProvider())
      ],
      child: MaterialApp(
        title: 'Recipe App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(whiteColor.withOpacity(0.1)),
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
            selectionHandleColor: primaryColor,
            selectionColor: greenColor.withOpacity(0.5),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
