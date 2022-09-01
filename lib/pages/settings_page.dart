import 'package:flutter/material.dart';
import 'package:lets_cook/components/drawer_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const DrawerItem(),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}
