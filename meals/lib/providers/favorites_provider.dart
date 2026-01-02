import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesNotifier extends Notifier<List<Meal>> {
  @override
  List<Meal> build() {
    return [];
  }

  bool toggleFavoriteMeal(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = NotifierProvider<FavoritesNotifier, List<Meal>>(
  FavoritesNotifier.new,
);
