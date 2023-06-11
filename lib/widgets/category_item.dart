import 'package:flutter/material.dart';

import '../screens/categories_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {super.key, required this.id, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    void selectCategory(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(CatogeriesMealScreen.routeName,
          arguments: {'id': id, 'title': title});
    }

    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Colors.yellow,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ));
  }
}
