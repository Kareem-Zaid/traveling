import 'package:flutter/material.dart';
import 'app_data.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دليل سياحي'),
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {}),
      body:
          // Container(color: Colors.amber, width: 366, height: 772) // This size is based on phone's 9:19 aspect ratio, which is usually smth like 393 x 830
          GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: categoriesData
            .map((categoryData) => CategoryItem(
                  title: categoryData.title,
                  imageLink: categoryData.imageURL,
                  id: categoryData.id,
                ))
            .toList(),
      ),
    );
  }
}
