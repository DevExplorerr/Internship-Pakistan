import 'package:eventify/screens/all_events_screen.dart';
import 'package:eventify/screens/profile_screen.dart';
import 'package:eventify/screens/search_screen.dart';
import 'package:eventify/widgets/bottom_navbar.dart';
import 'package:eventify/widgets/home_content.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      _currentSelectedIndex = index;
    });
  }

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      HomeContent(onSeeAllTap: updateCurrentIndex),
      const SearchScreen(),
      const AllEventsScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        currentSelectedIndex: _currentSelectedIndex,
        updateCurrentIndex: updateCurrentIndex,
      ),
      body: IndexedStack(index: _currentSelectedIndex, children: pages),
    );
  }
}
