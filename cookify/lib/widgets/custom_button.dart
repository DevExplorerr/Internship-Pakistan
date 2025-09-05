import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color buttonColor;
  final VoidCallback onPressed;
  final String buttonText;
  final double fontSize;
  final Color buttonTextColor;
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.buttonColor,
    required this.onPressed,
    required this.buttonText,
    required this.fontSize,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
