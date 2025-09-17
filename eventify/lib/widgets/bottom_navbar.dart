import 'package:eventify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBar extends StatelessWidget {
  final int currentSelectedIndex;
  final Function(int) updateCurrentIndex;

  const BottomNavBar({
    super.key,
    required this.currentSelectedIndex,
    required this.updateCurrentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.06;
    double activeIconSize = screenWidth * 0.065;
    double fontSize = screenWidth * 0.032;

    return BottomNavigationBar(
      currentIndex: currentSelectedIndex,
      onTap: updateCurrentIndex,
      type: BottomNavigationBarType.shifting,
      elevation: 0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: primaryColor,
      unselectedItemColor: const Color(0xff2C3550),
      selectedLabelStyle: GoogleFonts.poppins(
        color: primaryColor,
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        color: const Color(0xff2C3550),
        fontWeight: FontWeight.w600,
        fontSize: fontSize,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined, size: iconSize),
          activeIcon: Icon(Icons.explore, size: activeIconSize),
          label: "Explore",
          backgroundColor: whiteColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined, size: iconSize),
          activeIcon: Icon(Icons.search, size: activeIconSize),
          label: "Search",
          backgroundColor: whiteColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_outlined, size: iconSize),
          activeIcon: Icon(Icons.event, size: activeIconSize),
          label: "Events",
          backgroundColor: whiteColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline, size: iconSize),
          activeIcon: Icon(Icons.person, size: activeIconSize),
          label: "Profile",
          backgroundColor: whiteColor,
        ),
      ],
    );
  }
}
