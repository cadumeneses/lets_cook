import 'package:flutter/material.dart';
import 'package:lets_cook/components/drawer_item.dart';
import 'categories_page.dart';
import 'favorite_meal_page.dart';
import '../models/meal.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeal;

  const TabsPage(this.favoriteMeal, {Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;
  List<Map<String, Object>>? _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'title': 'Categories List',
        'page': const CategoriesPage(),
      },
      {
        'title': 'My Favorites',
        'page': FavoriteMealPage(widget.favoriteMeal),
      },
    ];
  }

  _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_pages![_selectedIndex]['title'] as String),
        ),
      ),
      drawer: const DrawerItem(),
      body: _pages![_selectedIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.tertiary,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
