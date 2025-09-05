import 'package:cookify/model/new_recipe_model.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewRecipeSection extends StatefulWidget {
  final List<NewRecipe> newRecipes;
  const NewRecipeSection({super.key, required this.newRecipes});

  @override
  State<NewRecipeSection> createState() => _NewRecipeSectionState();
}

class _NewRecipeSectionState extends State<NewRecipeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "New Recipes",
            style: GoogleFonts.poppins(
              color: blackColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 170,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.newRecipes.length,
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
            itemBuilder: (context, index) {
              final newRecipe = widget.newRecipes[index];
              return Container(
                width: 265,
                margin: const EdgeInsets.only(right: 25),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 30, 12, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Title
                          Text(
                            newRecipe.title,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: textPrimaryColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),

                          // Rating stars
                          Row(
                            children: List.generate(
                              5,
                              (starIndex) => Icon(
                                Icons.star,
                                color: yellowColor,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Author + Time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                newRecipe.author,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: secondaryColor,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: secondaryColor,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    newRecipe.time,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Image
                    Positioned(
                      top: 10,
                      right: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          newRecipe.image,
                          height: 80,
                          width: 80,
                          filterQuality: FilterQuality.medium,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
