import 'package:flutter/material.dart';
// import 'package:traveling/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, availableTrips, required this.applyFilter});
  static const route = '/filters';
  final Function applyFilter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

bool summer = false;
bool winter = false;
bool families = false;

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('فلترة الرحلات'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'summer': summer,
                  'winter': winter,
                  'families': families,
                };
                // print('summer after applying filter: ${selectedFilters['summer']}');
                // print('Map[summer] after applying filter: ${selectedFilters['summer']}');
                widget.applyFilter(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          buildSwitchListTile('الرحلات الصيفية', 'عرض الرحلات الصيفية', summer,
              (value) {
            setState(() {
              summer = value;
              // print('value inside setState: $summer');
            });
            // print('value out of setState: $summer');
            // widget.applyFilter;
            // I realized by try&error that when "setState" is "buildSwitchListTile"-inclusive, the switch stops changing its state
          }),
          buildSwitchListTile('الرحلات الشتوية', 'عرض الرحلات الشتوية', winter,
              (value) {
            setState(() {
              winter = value;
            });
            // widget.applyFilter;
          }),
          buildSwitchListTile(
              'الرحلات العائلية', 'عرض الرحلات العائلية', families, (value) {
            setState(() {
              families = value;
            });
            // widget.applyFilter;
          }),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(String title, String subtitle,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: updateValue);
  }
}
