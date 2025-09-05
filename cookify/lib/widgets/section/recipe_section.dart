import 'package:cookify/widgets/card/all_recipe_card.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeSection extends StatefulWidget {
  const RecipeSection({super.key});

  @override
  State<RecipeSection> createState() => _RecipeSectionState();
}

class _RecipeSectionState extends State<RecipeSection> {
  int selectedIndex = 0;

  final List<String> categories = [
    "All",
    "Italian",
    "Chinese",
    "Pakistani",
    "Asian",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? primaryColor : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: isSelected ? whiteColor : greenColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: kToolbarHeight),
        AllRecipeCard(selectedCategory: categories[selectedIndex]),
      ],
    );
  }
}
