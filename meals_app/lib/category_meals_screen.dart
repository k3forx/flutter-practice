import 'package:flutter/material.dart';

import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMealsScreen({
    super.key,
    // required this.categoryId,
    // required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final Meal meal = categoryMeals[index];
          return Text(meal.title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
