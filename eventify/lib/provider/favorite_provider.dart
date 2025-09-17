import 'package:flutter/foundation.dart';
import '../model/event_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<EventModel> _favorites = [];

  List<EventModel> get favorites => _favorites;

  bool isFavorite(EventModel events) {
    return _favorites.contains(events);
  }

  void toggleFavorite(EventModel events) {
    if (isFavorite(events)) {
      _favorites.remove(events);
    } else {
      _favorites.add(events);
    }
    notifyListeners();
  }
}

