// ignore_for_file: deprecated_member_use

import 'package:cookify/data/dummy_recipes.dart';
import 'package:cookify/widgets/card/recipe_card.dart';
import 'package:flutter/material.dart';

class AllRecipeCard extends StatefulWidget {
  final String selectedCategory;
  const AllRecipeCard({super.key, required this.selectedCategory});

  @override
  State<AllRecipeCard> createState() => _AllRecipeCardState();
}

class _AllRecipeCardState extends State<AllRecipeCard> {
  @override
  Widget build(BuildContext context) {
    final filteredRecipes = widget.selectedCategory == "All"
        ? dummyRecipes
        : dummyRecipes
              .where((recipe) => recipe.category == widget.selectedCategory)
              .toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 45,
      ),
      itemCount: filteredRecipes.length,
      itemBuilder: (context, index) {
        final recipe = filteredRecipes[index];
        return RecipeCard(recipe: recipe);
      },
    );
  }
}
