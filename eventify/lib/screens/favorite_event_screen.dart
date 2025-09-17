// ignore_for_file: deprecated_member_use

import 'package:eventify/provider/favorite_provider.dart';
import 'package:eventify/widgets/colors.dart';
import 'package:eventify/widgets/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteEventScreen extends StatefulWidget {
  const FavoriteEventScreen({super.key});
  @override
  State<FavoriteEventScreen> createState() => _FavoriteEventScreenState();
}

class _FavoriteEventScreenState extends State<FavoriteEventScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favorites = favoriteProvider.favorites;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: whiteColor, size: screenWidth * 0.075),
        title: Text("Favorite Events"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: whiteColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorites yet!"))
          : ListView.builder(
              itemCount: favorites.length,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
              itemBuilder: (context, index) {
                final events = favorites[index];
                return FavoriteCard(event: events);
              },
            ),
    );
  }
}
