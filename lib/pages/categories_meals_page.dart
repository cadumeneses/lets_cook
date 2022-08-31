import 'package:flutter/material.dart';
import 'package:lets_cook/components/meal_item.dart';
import 'package:lets_cook/data/dummy_data.dart';
import '../models/category.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoriesMeals = dummyMeals.where((meal) {
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
