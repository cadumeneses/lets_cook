import 'package:flutter/material.dart';
import 'package:lets_cook/components/meal_item.dart';
import 'package:lets_cook/models/meal.dart';
import '../models/category.dart';

class CategoriesMealsPage extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsPage(this.meals, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoriesMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: ListView.builder(
          itemCount: categoriesMeals.length,
          itemBuilder: ((ctx, index) {
            return MealItem(categoriesMeals[index]);
          }),
        ));
  }
}
