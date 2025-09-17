// ignore_for_file: deprecated_member_use

import 'package:eventify/services/auth_service.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/home_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final User? currentUser = authservice.value.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor, size: screenWidth * 0.075),
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: whiteColor,
              size: screenWidth * 0.07,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const HomeDrawer(),
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: screenWidth * 0.3,
      drawerScrimColor: blackColor.withOpacity(0.2),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            CircleAvatar(
              backgroundColor: blackColor,
              radius: screenWidth * 0.1,
              child: Icon(
                Icons.person,
                color: whiteColor,
                size: screenWidth * 0.1,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              currentUser?.displayName ?? "Guest User",
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.w600,
                color: primaryTextColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "165",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    Text(
                      "Following",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        color: secondaryTextColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: screenWidth * 0.1),
                Column(
                  children: [
                    Text(
                      "180",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w600,
                        color: blackColor,
                      ),
                    ),
                    Text(
                      "Followers",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: primaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.06,
                  vertical: screenHeight * 0.015,
                ),
              ),
              icon: const Icon(Icons.edit, color: primaryColor),
              label: Text(
                "Edit Profile",
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontSize: screenWidth * 0.04,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About Me",
                style: GoogleFonts.poppins(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const ExpandableText(
              text:
                  "Enjoy your favorite dishes and a lovely time with your friends and family. "
                  "Food from local food trucks will be available for purchase.",
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLength;
  const ExpandableText({super.key, required this.text, this.trimLength = 100});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final displayText = isExpanded || widget.text.length <= widget.trimLength
        ? widget.text
        : "${widget.text.substring(0, widget.trimLength)}...";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          style: GoogleFonts.poppins(
            fontSize: screenWidth * 0.035,
            color: blackColor,
          ),
        ),
        if (widget.text.length > widget.trimLength)
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Text(
              isExpanded ? "Read Less" : "Read More",
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
