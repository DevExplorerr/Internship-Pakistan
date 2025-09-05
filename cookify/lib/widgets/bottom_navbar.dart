import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';

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
    return BottomNavigationBar(
      currentIndex: currentSelectedIndex,
      onTap: updateCurrentIndex,
      type: BottomNavigationBarType.shifting,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primaryColor,
      unselectedItemColor: inActiveIconColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, size: 24),
          activeIcon: Icon(Icons.home_outlined, size: 26),
          label: "Home",
          backgroundColor: whiteColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 24),
          activeIcon: Icon(Icons.search, size: 26),
          label: "Search",
          backgroundColor: whiteColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark_border_sharp, size: 24),
          activeIcon: Icon(Icons.bookmark_border_sharp, size: 26),
          label: "Saved",
          backgroundColor: whiteColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_outlined, size: 24),
          activeIcon: Icon(Icons.notifications_outlined, size: 26),
          label: "Profile",
          backgroundColor: whiteColor,
        ),
      ],
    );
  }
}
