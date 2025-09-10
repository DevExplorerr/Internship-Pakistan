import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSection extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool readOnly;
  const SearchSection({
    super.key,
    this.controller,
    this.onTap,
    this.focusNode,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onTap: onTap,
              focusNode: focusNode,
              readOnly: readOnly,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Search recipe",
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  color: secondaryColor,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: const Icon(Icons.search, color: secondaryColor),
                fillColor: whiteColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: secondaryColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: secondaryColor, width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.filter_list_alt, color: whiteColor),
          ),
        ],
      ),
    );
  }
}
