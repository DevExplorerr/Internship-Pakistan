// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_first_flutter_app/colors.dart'; // Use your defined bgColor and primaryColor

class InterestsListScreen extends StatelessWidget {
  const InterestsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
        backgroundColor: bgColor,
        title: Text(
          "My Interests",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Hobbies List
              Expanded(
                child: ListView(
                  children: [
                    _buildHobbyTile(context, Icons.menu_book, "Reading"),
                    SizedBox(height: 15),
                    _buildHobbyTile(context, Icons.videogame_asset, "Gaming"),
                    SizedBox(height: 15),
                    _buildHobbyTile(context, Icons.restaurant_menu, "Cooking"),
                    SizedBox(height: 15),
                    _buildHobbyTile(context, Icons.self_improvement, "Yoga"),
                    SizedBox(height: 15),
                    _buildHobbyTile(context, Icons.brush, "Drawing"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildHobbyTile(BuildContext context, IconData icon, String label) {
  return Container(
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          )
        ]),
    child: ListTile(
      minTileHeight: 60,
      leading: Icon(icon, color: primaryColor, size: 28),
      title: Text(
        label,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w500, color: blackColor),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    ),
  );
}
