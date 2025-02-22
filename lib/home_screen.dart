import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';
import 'recipe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Recipe> recipes = [
    Recipe(
      name: "Spaghetti Bolognese",
      ingredients: "Spaghetti, ground beef, tomato sauce, onions, garlic",
      instructions: "Boil pasta, cook beef, add sauce, mix together.",
    ),
    Recipe(
      name: "Chicken Curry",
      ingredients: "Chicken, curry powder, coconut milk, onions, garlic",
      instructions: "Cook chicken, add spices, pour coconut milk, simmer.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe Book")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                    favoriteRecipes:
                        recipes.where((recipe) => recipe.isFavorite).toList(),
                  ),
                ),
              );
            },
            child: Text("View Favorites"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(recipes[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(recipe: recipes[index]),
                      ),
                    ).then((_) {
                      setState(() {}); // Update favorite status when returning
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
