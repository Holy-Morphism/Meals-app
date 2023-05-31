import 'package:flutter/material.dart';

import './screens/categories_meal_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'GustatoryDelightRegular'),
          bodyMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              fontFamily: 'GustatoryDelightRegular'),
          bodySmall: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Pacifico'),
          titleLarge: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      routes: {
        CatogeriesMealScreen.routeName: (context) => CatogeriesMealScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen()
      },
      home: const TabScreen(),
    );
  }
}
