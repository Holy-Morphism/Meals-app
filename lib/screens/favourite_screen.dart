import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favMeal;
  const FavouriteScreen(this.favMeal);

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return const Center(
        child: Text('No Favourites yet, Star to add more'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              favMeal[index].id,
              favMeal[index].title,
              favMeal[index].imageUrl,
              favMeal[index].duration,
              favMeal[index].complexity,
              favMeal[index].affordability);
        },
        itemCount: favMeal.length,
      );
    }
  }
}
