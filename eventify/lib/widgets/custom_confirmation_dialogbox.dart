import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomConfirmationDialogbox extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final String buttonText;
  const CustomConfirmationDialogbox(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteColor,
      title: Text(
        title,
        style: GoogleFonts.raleway(
          color: blackColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: GoogleFonts.raleway(
              color: blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        CustomButton(
            onPressed: onPressed,
            buttonColor: primaryColor,
            buttonText: buttonText,
            buttonTextColor: whiteColor)
      ],
    );
  }
}
