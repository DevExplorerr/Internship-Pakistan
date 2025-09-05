class Recipe {
  final String title;
  final String image;
  final String time;
  final String reviews;
  final String category;
  final List<Map<String, String>> ingredients;
  final List<String> procedure;

  Recipe({
    required this.title,
    required this.image,
    required this.time,
    required this.reviews,
    required this.category,
    required this.ingredients,
    required this.procedure,
  });

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      title: map['title']!,
      image: map['image']!,
      time: map['time']!,
      reviews: map['reviews']!,
      category: map['category']!,
      ingredients: List<Map<String, String>>.from(map['ingredients'] ?? []),
      procedure: List<String>.from(map['procedure'] ?? []),
    );
  }
}
