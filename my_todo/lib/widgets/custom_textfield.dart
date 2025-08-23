import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_todo/widgets/colors.dart';

class CustomTextfield extends StatelessWidget {
  final String? hintText;
  final TextInputType textInputType;
  final TextEditingController controller;
  final int? maxLines;
  const CustomTextfield({
    super.key,
    this.hintText,
    required this.textInputType,
    required this.controller,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      maxLines: maxLines,
      style: GoogleFonts.lato(color: primaryTextColor),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.lato(
          color: secondaryTextColor,
          fontWeight: FontWeight.w400,
        ),
        fillColor: bgColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: borderSideColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: borderSideColor),
        ),
      ),
    );
  }
}
