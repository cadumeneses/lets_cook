import 'package:flutter/material.dart';
import 'package:lets_cook/pages/categories_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s Cook?',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const CategoriesPage(),
    );
  }
}
