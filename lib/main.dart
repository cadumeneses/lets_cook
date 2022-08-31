import 'package:flutter/material.dart';
import 'package:lets_cook/pages/categories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

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
        ),
      ),
      home: const CategoriesPage(),
    );
  }
}
