import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/fastfood.gif'),
          const SizedBox(height: 20),
          Text(
            "Simple. Fast. Flutter",
            style: TextStyle(
              color: primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      )),
    );
  }
}
