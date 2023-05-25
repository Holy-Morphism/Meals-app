import 'package:flutter/material.dart';

class CatogeriesMealScreen extends StatelessWidget {
  // final String id, title;
  // const CatogeriesMealScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];
    final title = routeArgs['title'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(child: Text('The Recipes for the Category')),
    );
  }
}
