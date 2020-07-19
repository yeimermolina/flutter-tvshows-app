import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../data/data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TVShows'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: CATEGORIES
            .map(
              (category) =>
                  CategoryItem(category.id, category.title, category.color),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
