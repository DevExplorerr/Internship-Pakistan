// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:cookify/data/dummy_recipes.dart';
import 'package:cookify/model/recipe_model.dart';
import 'package:cookify/widgets/colors.dart';
import 'package:cookify/widgets/card/search_screen_recipe_card.dart';
import 'package:cookify/widgets/section/search_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String query = "";
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        query = _controller.text.trim();
      });
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = dummyRecipes.where((recipe) {
      final title = recipe.title.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const SizedBox(height: 15),
          SearchSection(controller: _controller, focusNode: _focusNode),
          const SizedBox(height: 20),

          // Show results
          Expanded(child: _buildResults(filtered)),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      centerTitle: true,
      elevation: 0,
      backgroundColor: whiteColor,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: blackColor),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Search Recipes",
        style: GoogleFonts.poppins(
          color: blackColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildResults(List<Recipe> filtered) {
    if (query.isEmpty) {
      return _buildMessage("Start typing to search recipes...");
    } else if (filtered.isEmpty) {
      return _buildMessage("No recipes found");
    }
    return GridView.builder(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.6,
      ),
      itemCount: filtered.length,
      itemBuilder: (context, index) {
        final recipe = filtered[index];
        return SearchScreenRecipeCard(recipe: recipe);
      },
    );
  }

  Widget _buildMessage(String message) {
    return Center(
      child: Text(
        message,
        style: GoogleFonts.poppins(fontSize: 14, color: greyColor),
      ),
    );
  }
}
