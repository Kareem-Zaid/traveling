import 'package:flutter/material.dart';
import 'package:traveling/app_drawer.dart';
import 'package:traveling/categories_screen.dart';
import 'package:traveling/favorites_screen.dart';
// import 'package:traveling/categories_screen.dart';
// import 'package:traveling/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedTabIndex = 0;
  List<Map<String, Object>> tabs = [
    {'Screen': const CategoriesScreen(), 'Title': 'تصنيفات الرحلات'},
    {'Screen': const FavouritesScreen(), 'Title': 'المفضلة'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: Text(tabs[selectedTabIndex]['Title'] as String)),
      body: tabs[selectedTabIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.5),
        selectedItemColor: Colors.deepPurple[900],
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: 'التصنيفات'),
          BottomNavigationBarItem(
              label: 'المفضلة', icon: Icon(Icons.star_border)),
        ],
        currentIndex: selectedTabIndex,
        onTap: (index) => setState(() {
          selectedTabIndex = index;
        }),
      ),
      // "as Widget" removes the error; the compiler isn't satisfied with "Object" declaration ya cd
    );
  }
}
