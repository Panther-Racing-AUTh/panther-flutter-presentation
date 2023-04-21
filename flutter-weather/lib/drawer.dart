import 'package:flutter/material.dart';

import 'main.dart';
import 'weather_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade100,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('My Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(
                    title: 'My Home Page',
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.sunny),
            title: const Text('Weather Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
