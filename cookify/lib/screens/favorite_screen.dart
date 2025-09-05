import 'package:cookify/provider/favorite_provider.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/card/recipe_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          "My Favorites",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: blackColor,
          ),
        ),
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 80,
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                "No favorites yet!\nStart saving recipes",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: secondaryColor,
                ),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 40,
                bottom: 10,
              ),

              itemCount: favorites.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 35,
              ),
              itemBuilder: (context, index) {
                final recipe = favorites[index];
                return RecipeCard(recipe: recipe);
              },
            ),
    );
  }
}
