import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/ingredient.dart';
import 'model/recipe.dart';
import 'view/recipe.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IngredientListModel()),
    ChangeNotifierProvider(create: (context) => RecipeListModel()),
  ], child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Recipe App', theme: ThemeData(fontFamily: 'Montserrat'), initialRoute: '/', routes: {
      RecipeListScreen.routeName: (context) => RecipeListScreen(),
      RecipeDetailsScreen.routeName: (context) => RecipeDetailsScreen(),
      NewRecipeScreen.routeName: (context) => NewRecipeScreen(),
    });
  }
}
