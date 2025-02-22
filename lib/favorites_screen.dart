import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'recipe.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> favoriteRecipes;

  FavoritesScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Recipes")),
      body: favoriteRecipes.isEmpty
          ? Center(child: Text("No favorites added yet."))
          : ListView.builder(
              itemCount: favoriteRecipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(favoriteRecipes[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(recipe: favoriteRecipes[index]),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
