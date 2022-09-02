import 'package:flutter/material.dart';
import 'package:lets_cook/components/meal_item.dart';
import '../models/meal.dart';

class FavoriteMealPage extends StatelessWidget {
  final List<Meal> favoriteMeal;

  const FavoriteMealPage(this.favoriteMeal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(child: Text('No meal marked with favorite'));
    } else {
      return ListView.builder(
        itemCount: favoriteMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoriteMeal[index]);
        },
      );
    }
  }
}
