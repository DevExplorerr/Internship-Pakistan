// ignore_for_file: deprecated_member_use

import 'package:cookify/model/recipe_model.dart';
import 'package:cookify/provider/favorite_provider.dart';
import 'package:cookify/screens/recipe_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../colors.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isSaved = favoritesProvider.isFavorite(recipe);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(recipe: recipe),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Recipe content
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 82, 12, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      recipe.title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: textPrimaryColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),

                  // Time + Bookmark Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time',
                            style: GoogleFonts.poppins(
                              color: greyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            recipe.time,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: textPrimaryColor,
                            ),
                          ),
                        ],
                      ),

                      // Bookmark button
                      GestureDetector(
                        onTap: () => favoritesProvider.toggleFavorite(recipe),
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            color: whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            isSaved
                                ? Icons.bookmark
                                : Icons.bookmark_border_outlined,
                            color: primaryColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Recipe image
            Positioned(
              top: -30,
              left: 0,
              right: 0,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    recipe.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.medium, 
                  ),
                ),
              ),
            ),

            // Rating badge
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[800], size: 16),
                    const SizedBox(width: 4),
                    Text(
                      recipe.reviews,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
