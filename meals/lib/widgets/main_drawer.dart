import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Cooking Up!'),
            automaticallyImplyLeading: false,
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text('Meals'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_alt),
            title: const Text('Filters'),
            onTap: () {
              onSelectScreen('filters');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}
