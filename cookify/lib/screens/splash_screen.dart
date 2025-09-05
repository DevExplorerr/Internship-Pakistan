// ignore_for_file: use_build_context_synchronously

import 'package:cookify/screens/home_screen.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:cookify/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/splash_images/splash.png',
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          // Content
          Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 20,
              bottom: 40,
            ),
            child: Column(
              children: [
                const SizedBox(height: kToolbarHeight + 40),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/splash_images/chef_icon.png",
                      filterQuality: FilterQuality.medium,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '100K+ Premium Recipe',
                      style: GoogleFonts.poppins(
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'Get\nCooking',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: whiteColor,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Simple way to find Tasty Recipe',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: kToolbarHeight + 10),
                CustomButton(
                  width: 243,
                  height: 54,
                  buttonColor: primaryColor,
                  onPressed: () {},
                  buttonText: "Start Cooking",
                  fontSize: 16,
                  buttonTextColor: whiteColor,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
