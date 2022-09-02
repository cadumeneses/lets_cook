import 'package:flutter/material.dart';
import 'package:lets_cook/models/settings.dart';
import 'utils/app_routes.dart';
import 'pages/tabs_page.dart';
import 'pages/categories_meals_page.dart';
import 'pages/meal_detail_page.dart';
import 'pages/settings_page.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaibleMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaibleMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  final ThemeData tema = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Cook?',
      theme: tema.copyWith(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme: tema.colorScheme.copyWith(
              primary: Colors.red,
              secondary: Colors.purple,
              tertiary: Colors.amber),
          textTheme: tema.textTheme.copyWith(
            headline6: const TextStyle(
                fontFamily: 'Barlow',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            headline5: const TextStyle(
                fontFamily: 'Barlow',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red),
          )),
      routes: {
        AppRoutes.home: (ctx) => TabsPage(_favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) => CategoriesMealsPage(_avaibleMeals),
        AppRoutes.mealsDetail: (ctx) => MealDetailPage(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (ctx) => SettingsPage(_filterMeals, settings),
      },
    );
  }
}
