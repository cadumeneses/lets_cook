import 'package:flutter/material.dart';
import 'package:lets_cook/components/category_item.dart';
import 'package:lets_cook/data/dummy_data.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Revenues?",
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
