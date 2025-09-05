import 'package:cookify/screens/favorite_screen.dart';
import 'package:cookify/screens/notification_screen.dart';
import 'package:cookify/screens/search_screen.dart';
import 'package:cookify/widgets/bottom_navbar.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:cookify/widgets/home_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSelectedIndex = 0;
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomeContent(),
      const SearchScreen(),
      FavoritesScreen(),
      const NotificationScreen(),
    ];
  }

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: whiteColor,
        body: IndexedStack(index: currentSelectedIndex, children: pages),
        bottomNavigationBar: BottomNavBar(
          currentSelectedIndex: currentSelectedIndex,
          updateCurrentIndex: updateCurrentIndex,
        ),
      ),
    );
  }
}
