/*
import 'package:flutter/material.dart';
import 'package:traveling/categories_screen.dart';
import 'package:traveling/favorites_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('دليل سياحي'),
            bottom: const TabBar(tabs: [
              Tab(text: 'التصنيفات', icon: Icon(Icons.grid_view)),
              Tab(text: 'المفضلة', icon: Icon(Icons.star_border)),
            ]),
          ),
          body: const TabBarView(children: [
            CategoriesScreen(),
            FavouritesScreen(),
          ])),
    );
  }
}
*/