import 'package:flutter/material.dart';
import 'recipe.dart';

class DetailsScreen extends StatefulWidget {
  final Recipe recipe;

  DetailsScreen({required this.recipe});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(widget.recipe.ingredients),
            SizedBox(height: 10),
            Text("Instructions:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(widget.recipe.instructions),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.recipe.isFavorite = !widget.recipe.isFavorite;
                });
              },
              child: Text(widget.recipe.isFavorite
                  ? "Unmark Favorite"
                  : "Mark as Favorite"),
            ),
          ],
        ),
      ),
    );
  }
}
