import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';

import './screens/filter_screen.dart';
import './screens/categories_meal_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = dummyMeals;
  List<Meal> _favouriteMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = dummyMeals.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(dummyMeals.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFav(String mealId) {
    return _favouriteMeals.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        cardColor: Colors.orange,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Pacifico',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 35,
            fontFamily: 'GustatoryDelightRegular',
            color: Colors.grey,
          ),
          bodyMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'GustatoryDelightRegular'),
          bodySmall: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Roboto'),
          titleLarge: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(_favouriteMeals),
        CatogeriesMealScreen.routeName: (context) =>
            CatogeriesMealScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavourite, _isFav),
        FilterScreen.routeName: (context) => FilterScreen(_setFilters)
      },
    );
  }
}
