// ignore_for_file: deprecated_member_use

import 'package:cookify/model/recipe_model.dart';
import 'package:cookify/provider/favorite_provider.dart';
import 'package:cookify/screens/recipe_detail_screen.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchScreenRecipeCard extends StatelessWidget {
  final Recipe recipe;
  const SearchScreenRecipeCard({super.key, required this.recipe});

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
        decoration: BoxDecoration(
          color: secondaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: greyColor.withOpacity(0.15),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Recipe image with bookmark
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      recipe.image,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => favoritesProvider.toggleFavorite(recipe),
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: whiteColor.withOpacity(0.8),
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
                ),
              ],
            ),

            // Recipe info
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: textPrimaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15),

                  // Cooking time + rating row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        recipe.time,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: greyColor,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: yellowColor, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            recipe.reviews,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: blackColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
