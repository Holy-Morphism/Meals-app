import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';

import '../widgets/meal_item.dart';

class CatogeriesMealScreen extends StatefulWidget {
  // final String id, title;
  final List<Meal> meals;
  const CatogeriesMealScreen(this.meals);
  static const String routeName = '/category-meal-screen';

  @override
  State<CatogeriesMealScreen> createState() => _CatogeriesMealScreenState();
}

class _CatogeriesMealScreenState extends State<CatogeriesMealScreen> {
  bool didChange = false;
  List<Meal> categoryMeals = [];
  String title = "";
  @override
  void didChangeDependencies() {
    if (!didChange) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final id = routeArgs['id'];
      title = routeArgs['title'] as String;
      categoryMeals = widget.meals
          .where((element) => element.categories.contains(id))
          .toList();
      super.didChangeDependencies();
      didChange = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            categoryMeals[index].id,
            categoryMeals[index].title,
            categoryMeals[index].imageUrl,
            categoryMeals[index].duration,
            categoryMeals[index].complexity,
            categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
