import 'package:flutter/material.dart';

import './screens/categories_meal_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
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
          titleLarge: TextStyle(
            fontFamily: 'Pacifico',
          ),
        ),
      ),
      routes: {
        CatogeriesMealScreen.routeName: (context) => CatogeriesMealScreen()
      },
      home: const CategoriesScreen(),
    );
  }
}
