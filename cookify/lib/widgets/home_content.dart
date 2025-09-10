// ignore_for_file: use_build_context_synchronously

import 'package:cookify/data/new_dummy_recipes.dart';
import 'package:cookify/widgets/section/recipe_section.dart';
import 'package:cookify/screens/search_screen.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:cookify/widgets/section/new_recipe_section.dart';
import 'package:cookify/widgets/section/search_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kToolbarHeight - 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello ',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'What are you cooking today?',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SearchSection(
                readOnly: true,
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const SearchScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            final offsetAnimation = Tween<Offset>(
                              begin: const Offset(0, 0.1),
                              end: Offset.zero,
                            ).animate(animation);

                            final opacityAnimation = Tween<double>(
                              begin: 0,
                              end: 1,
                            ).animate(animation);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: FadeTransition(
                                opacity: opacityAnimation,
                                child: child,
                              ),
                            );
                          },
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),
              const RecipeSection(),
              const SizedBox(height: 20),
              NewRecipeSection(newRecipes: newRecipes),
            ],
          ),
        ),
      ),
    );
  }
}
