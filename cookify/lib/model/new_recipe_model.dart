class NewRecipe {
  final String title;
  final String author;
  final String time;
  final String image;
  final List<Map<String, String>> ingredients;
  final List<String> procedure;

  NewRecipe({
    required this.title,
    required this.author,
    required this.time,
    required this.image,
    required this.ingredients,
    required this.procedure,
  });

  factory NewRecipe.fromMap(Map<String, dynamic> map) {
    return NewRecipe(
      title: map['title'] as String,
      author: map['author'] as String,
      time: map['time'] as String,
      image: map['image'] as String,
      ingredients: (map['ingredients'] as List<dynamic>)
          .map((item) => Map<String, String>.from(item as Map))
          .toList(),
      procedure: List<String>.from(map['procedure'] as List<dynamic>),
    );
  }
}
