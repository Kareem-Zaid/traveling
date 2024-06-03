import 'package:flutter/material.dart';
import 'package:traveling/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 75,
            width: double.infinity,
            color: Theme.of(context).colorScheme.inversePrimary,
            child: Text('دليل سياحي',
                style: Theme.of(context).textTheme.displaySmall),
          ),
          buildListTile(Icons.grid_view, 'التصنيفات', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile(Icons.filter_list, 'الفلترة', () {
            // Navigator.of(context).pushReplacementNamed(FiltersScreen.route);
            Navigator.of(context).pushNamed(FiltersScreen.route);
            // "push*" automatically generates back button; "pushReplacement*" doesn't
          }),
        ],
      ),
    );
  }

  Widget buildListTile(IconData icon, String title, Function() goToScreen) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: goToScreen,
      ),
    );
  }
}
