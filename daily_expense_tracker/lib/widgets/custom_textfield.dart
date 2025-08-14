import 'package:daily_expense_tracker/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final Icon? suffixIcon;
  final TextEditingController controller;
  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 0,
            blurRadius: 12,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(color: secondarytextColor),
          suffixIcon: suffixIcon,
          fillColor: bgColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: bgColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: bgColor),
          ),
        ),
      ),
    );
  }
}
