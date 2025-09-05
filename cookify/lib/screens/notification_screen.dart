import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          "My Notifications",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Text(
          "No Notifications",
          style: GoogleFonts.poppins(
            color: blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
