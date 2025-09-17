import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final Icon? prefixIcon;
  final bool? obsecureText;
  final ValueChanged<String>? onChanged;

  const CustomTextfield({
    super.key,
    required this.hintText,
    required this.labelText,
    this.keyboardType,
    this.suffixIcon,
    this.obsecureText,
    this.prefixIcon,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth * 0.04;
    final hintFontSize = screenWidth * 0.035;
    final horizontalPadding = screenWidth * 0.06;
    final verticalPadding = screenWidth * 0.04;
    final borderRadius = screenWidth * 0.25;

    return TextFormField(
      style: GoogleFonts.rubik(color: blackColor, fontSize: fontSize),
      keyboardType: keyboardType,
      controller: controller,
      textInputAction: TextInputAction.next,
      obscureText: obsecureText ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.rubik(
          color: secondaryTextColor,
          fontSize: hintFontSize,
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.rubik(
          color: secondaryTextColor,
          fontSize: hintFontSize,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: secondaryTextColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
    );
  }
}
