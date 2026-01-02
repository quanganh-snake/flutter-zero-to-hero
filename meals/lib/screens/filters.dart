import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterMealsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        leading: IconButton(
          onPressed: () {
            ref.read(filterMealsProvider.notifier).setFilters({
              MealFilter.glutenFree: activeFilters[MealFilter.glutenFree]!,
              MealFilter.lactoseFree: activeFilters[MealFilter.lactoseFree]!,
              MealFilter.vegan: activeFilters[MealFilter.vegan]!,
              MealFilter.vegetarian: activeFilters[MealFilter.vegetarian]!,
            });
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Gluten-free'),
            subtitle: const Text('Only include gluten-free meals.'),
            value: activeFilters[MealFilter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterMealsProvider.notifier)
                  .setFilter(MealFilter.glutenFree, isChecked);
            },
          ),
          SwitchListTile(
            title: const Text('Lactose-free'),
            subtitle: const Text('Only include lactose-free meals.'),
            value: activeFilters[MealFilter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterMealsProvider.notifier)
                  .setFilter(MealFilter.lactoseFree, isChecked);
            },
          ),
          SwitchListTile(
            title: const Text('Vegetarian'),
            subtitle: const Text('Only include vegetarian meals.'),
            value: activeFilters[MealFilter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterMealsProvider.notifier)
                  .setFilter(MealFilter.vegetarian, isChecked);
            },
          ),
          SwitchListTile(
            title: const Text('Vegan'),
            subtitle: const Text('Only include vegan meals.'),
            value: activeFilters[MealFilter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterMealsProvider.notifier)
                  .setFilter(MealFilter.vegan, isChecked);
            },
          ),
        ],
      ),
    );
  }
}
