import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourite_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favMeal;
  TabScreen(this.favMeal);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, dynamic>> _pages = [];
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouriteScreen(widget.favMeal), 'title': 'Favourite'},
    ];
    super.initState();
  }

  int _selected = 0;
  void _selectedPage(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selected]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selected]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Theme.of(context).cardColor,
        currentIndex: _selected,
//type: BottomNavigationBarType.shifting,
        onTap: _selectedPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
