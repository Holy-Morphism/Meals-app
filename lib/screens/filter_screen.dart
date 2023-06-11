import 'package:flutter/material.dart';

import 'package:mealapp/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(this._setFilters);
  static const String routeName = '/filter-screen';
  final Function _setFilters;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isglutenfree = false;

  bool _isVegeterian = false;

  bool _isVegan = false;

  bool _isLactoseFree = false;

  @override
  Widget build(BuildContext context) {
    print('filter build');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _isglutenfree,
                    'lactose': _isLactoseFree,
                    'vegan': _isVegan,
                    'vegetarian': _isVegeterian,
                  };
                  widget._setFilters(selectedFilters);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Adjust you meal selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitch(context, 'Gluten free',
                    'Meals that are gluten free', _isglutenfree, (newValue) {
                  setState(() {
                    _isglutenfree = newValue;
                  });
                }),
                buildSwitch(context, 'Vegetarian', 'Meals that are vegetarian',
                    _isVegeterian, (newValue) {
                  setState(() {
                    _isVegeterian = newValue;
                  });
                }),
                buildSwitch(context, 'Vegan', 'Meals that are vegan', _isVegan,
                    (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                buildSwitch(context, 'Lactose free',
                    'Meals that are Lactose free', _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }

  SwitchListTile buildSwitch(BuildContext context, String title,
      String subtitle, bool option, Function(bool) onTap) {
    return SwitchListTile(
      title: Text(title),
      value: option,
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      onChanged: onTap,
    );
  }
}
