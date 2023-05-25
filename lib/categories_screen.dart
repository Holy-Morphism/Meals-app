import 'package:flutter/material.dart';
import './category_item.dart';
import './dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DeliMeals',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 3 / 2),
          children: dummyCategories
              .map(
                (e) => CategoryItem(
                  id: e.id,
                  title: e.title,
                  color: e.color,
                ),
              )
              .toList()),
    );
  }
}
