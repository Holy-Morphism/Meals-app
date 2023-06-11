import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function _toggleFavourite;
  final Function _isFav;

  const MealDetailScreen(this._toggleFavourite, this._isFav);
  static const String routeName = '/meal-detial-screen';

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere(
      (element) => element.id == mealId,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSection(context, 'Ingredients'),
            buildContainerList(ListView.builder(
              itemBuilder: (ctx, i) => Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    selectedMeal.ingredients[i],
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSection(context, 'Steps'),
            buildContainerList(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    const Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _toggleFavourite(mealId),
        child: Icon(_isFav(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }

  Container buildContainerList(Widget child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  Container buildSection(BuildContext context, final String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
