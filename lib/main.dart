import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/ingredient.dart';
import 'model/recipe.dart';
import 'view/ingredient.dart';
import 'view/recipe.dart';
import 'view/shared.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => IngredientListModel()),
    ChangeNotifierProvider(create: (context) => RecipeListModel()),
  ], child: App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Recipe App',
        theme: ThemeData(
            fontFamily: 'Montserrat',
            brightness: Brightness.dark,
            primarySwatch: Colors.green,
            canvasColor: Colors.black38),
        initialRoute: '/',
        routes: {
          MainScreen.routeName: (context) => MainScreen(),
          NewRecipeScreen.routeName: (context) => NewRecipeScreen(),
          NewIngredientScreen.routeName: (context) => NewIngredientScreen(),
        });
  }
}
