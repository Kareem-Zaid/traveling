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
  Map<String, bool> selectedFilters = {
    'summer': summer,
    'winter': winter,
    'families': families,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('فلترة الرحلات')),
      body: Column(
        children: [
          buildSwitchListTile('الرحلات الصيفية', 'عرض الرحلات الصيفية', summer,
              (value) {
            setState(() {
              summer = value;
            });
            selectedFilters['summer'] = summer;
            // print('After adding summer: $selectedFilters');
            widget.applyFilter(selectedFilters);
            // I realized by try&error that when "setState" is "buildSwitchListTile"-inclusive, the switch stops changing its state
          }),
          buildSwitchListTile('الرحلات الشتوية', 'عرض الرحلات الشتوية', winter,
              (value) {
            setState(() {
              winter = value;
            });
            selectedFilters['winter'] = winter;
            // print('After adding winter: $selectedFilters');
            widget.applyFilter(selectedFilters);
          }),
          buildSwitchListTile(
              'الرحلات العائلية', 'عرض الرحلات العائلية', families, (value) {
            setState(() {
              families = value;
            });
            selectedFilters['families'] = families;
            // print('After adding families: $selectedFilters');
            widget.applyFilter(selectedFilters);
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
