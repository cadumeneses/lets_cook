import 'package:flutter/material.dart';
import 'package:lets_cook/utils/app_routes.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key}) : super(key: key);

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
            fontFamily: 'Hubballi',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.purple.shade400),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.tertiary,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Let\'s Cook',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.restaurant,
            'Meals',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.home),
          ),
          const SizedBox(height: 20),
          _createItem(
            Icons.settings,
            'Settings',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.settings),
          ),
        ],
      ),
    );
  }
}
