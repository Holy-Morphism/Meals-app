import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id, title, imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem(this.id, this.title, this.imageUrl, this.duration,
      this.complexity, this.affordability);
  String get complexityString {
    switch (complexity) {
      case Complexity.simple:
        {
          return 'Simple';
        }
      case Complexity.challenging:
        {
          return 'Challenging';
        }
      case Complexity.hard:
        {
          return 'Hard';
        }
      default:
        return 'Unknown';
    }
  }

  String get affordabilityString {
    switch (affordability) {
      case Affordability.affordable:
        {
          return 'Affordable';
        }
      case Affordability.pricey:
        {
          return 'Pricey';
        }
      case Affordability.luxurious:
        {
          return 'Luxurious';
        }
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    void selectMeal() {
      Navigator.of(context)
          .pushNamed(MealDetailScreen.routeName, arguments: id);
    }

    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          '$duration min',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.work,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          complexityString,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.attach_money,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          affordabilityString,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
