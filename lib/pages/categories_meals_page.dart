import 'package:flutter/material.dart';
import 'package:lets_cook/components/category_item.dart';
import 'package:lets_cook/data/dummy_data.dart';
import '../models/category.dart';

class CategoriesMealsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            category.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: const Center(
          child: Text(
            'Revanues of categories',
          ),
        ));
  }
}
