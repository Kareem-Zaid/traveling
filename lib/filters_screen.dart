import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.applyFilter});
  static const route = '/filters';
  final Function applyFilter;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

bool summer = true;
bool winter = true;
bool families = true;

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
            widget.applyFilter(selectedFilters);
          }),
          buildSwitchListTile('الرحلات الشتوية', 'عرض الرحلات الشتوية', winter,
              (value) {
            setState(() {
              winter = value;
            });
            selectedFilters['winter'] = winter;
            widget.applyFilter(selectedFilters);
          }),
          buildSwitchListTile(
              'الرحلات العائلية', 'عرض الرحلات العائلية', families, (value) {
            setState(() {
              families = value;
            });
            selectedFilters['families'] = families;
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
      onChanged: updateValue,
    );
  }
}
