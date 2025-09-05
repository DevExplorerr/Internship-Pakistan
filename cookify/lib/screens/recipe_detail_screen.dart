// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:cookify/model/recipe_model.dart';
import 'package:cookify/provider/favorite_provider.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  bool _showIngredients = true;

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isSaved = favoritesProvider.isFavorite(widget.recipe);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: whiteColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: blackColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Header with image, rating, time, bookmark
            Container(
              height: 260,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  // Blurred Background Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Image.asset(
                        widget.recipe.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        filterQuality: FilterQuality.medium,
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          blackColor.withOpacity(0.2),
                          blackColor.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),

                  // Foreground Content
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Hero(
                          tag: widget.recipe.image,
                          child: Image.asset(
                            widget.recipe.image,
                            height: 200,
                            fit: BoxFit.contain,
                            filterQuality: FilterQuality.medium,
                          ),
                        ),
                      ),

                      // Rating
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: yellowColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow[800],
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.recipe.reviews,
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

                      // Time + Bookmark
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: whiteColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    color: whiteColor,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    widget.recipe.time,
                                    style: GoogleFonts.poppins(
                                      color: whiteColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => favoritesProvider.toggleFavorite(
                                widget.recipe,
                              ),
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: whiteColor,
                                child: Icon(
                                  isSaved
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: primaryColor,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Title
            Text(
              widget.recipe.title,
              style: GoogleFonts.poppins(
                color: blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 30),

            // Toggle Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabButton("Ingredients", _showIngredients, () {
                  setState(() => _showIngredients = true);
                }),
                _buildTabButton("Procedure", !_showIngredients, () {
                  setState(() => _showIngredients = false);
                }),
              ],
            ),

            const SizedBox(height: 30),

            // Info Row
            Row(
              children: [
                Icon(Icons.lunch_dining_outlined, color: greyColor, size: 20),
                const SizedBox(width: 6),
                Text(
                  "1 serve",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyColor,
                  ),
                ),
                const Spacer(),
                Text(
                  _showIngredients
                      ? "${widget.recipe.ingredients.length} items"
                      : "${widget.recipe.procedure.length} steps",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: greyColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            _showIngredients ? _buildIngredientsList() : _buildProcedureList(),
          ],
        ),
      ),
    );
  }

  // Reusable tab button
  Widget _buildTabButton(String text, bool selected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 150,
        decoration: BoxDecoration(
          color: selected ? primaryColor : whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: whiteColor),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: selected ? whiteColor : primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  // Ingredients List
  Widget _buildIngredientsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.recipe.ingredients.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final ingredient = widget.recipe.ingredients[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.circle, color: blackColor, size: 10),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  ingredient["name"]!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: textPrimaryColor,
                  ),
                ),
              ),
              Text(
                ingredient["quantity"]!,
                style: GoogleFonts.poppins(
                  color: greyColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Procedure List
  Widget _buildProcedureList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.recipe.procedure.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final procedure = widget.recipe.procedure[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 10,
            bottom: 25,
          ),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25,
                width: 55,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Step ${index + 1}",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                procedure,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: textPrimaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
