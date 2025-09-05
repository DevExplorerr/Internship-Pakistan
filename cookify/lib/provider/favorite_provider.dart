import 'package:flutter/material.dart';
import '../model/recipe_model.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Recipe> _favorites = [];

  List<Recipe> get favorites => _favorites;

  bool isFavorite(Recipe recipe) {
    return _favorites.contains(recipe);
  }

  void toggleFavorite(Recipe recipe) {
    if (_favorites.contains(recipe)) {
      _favorites.remove(recipe);
    } else {
      _favorites.add(recipe);
    }
    notifyListeners();
  }
}
