import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meals_provider.dart';

class FilterNotifier extends Notifier<Map<MealFilter, bool>> {
  @override
  Map<MealFilter, bool> build() {
    return {
      MealFilter.glutenFree: false,
      MealFilter.lactoseFree: false,
      MealFilter.vegan: false,
      MealFilter.vegetarian: false,
    };
  }

  void setFilters(Map<MealFilter, bool> filters) {
    state = filters;
  }

  void setFilter(MealFilter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterMealsProvider =
    NotifierProvider<FilterNotifier, Map<MealFilter, bool>>(FilterNotifier.new);

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterMealsProvider);

  return meals.where((meal) {
    if (activeFilters[MealFilter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[MealFilter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[MealFilter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (activeFilters[MealFilter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
