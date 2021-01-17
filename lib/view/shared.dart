import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/ingredient.dart';
import '../model/recipe.dart';
import 'ingredient.dart';
import 'recipe.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/';

  MainScreen();

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  var index = 0;
  Widget body;
  String title;

  bool enableAddition;
  Function action;

  void _loadNewScreen(BuildContext context, int index) {
    setState(() {
      switch (index) {
        case 0:
          List<Recipe> recipeList;

          context.select((RecipeListModel rlm) => recipeList = rlm.recipeList);

          title = 'Recipes';

          enableAddition = true;
          action = () {
            Navigator.pushNamed(context, NewRecipeScreen.routeName);
          };

          body = ListView(children: [
            for (var recipe in recipeList)
              ListTile(
                  title: Text(recipe.name),
                  onTap: () {
                    Navigator.pushNamed(context, RecipeDetailsScreen.routeName, arguments: recipe);
                  })
          ]);
          break;
        case 1:
          title = 'Pantry';

          enableAddition = true;
          action = () {
            Navigator.pushNamed(context, NewIngredientState.routeName);
          };

          var ingredientList = IngredientListModel.knownIngredients;

          body = ListView(children: [
            for (var ingredient in ingredientList)
              ListTile(
                  title: Text(ingredient.name),
                  onTap: () {
                    // Modal card
                  })
          ]);
          break;
        // case 2:
        //   Navigator.pushReplacementNamed(context, ShoppingListScreen.routeName);
        //   break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadNewScreen(context, index);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      floatingActionButtonLocation: enableAddition ? FloatingActionButtonLocation.endFloat : null,
      floatingActionButton:
          enableAddition ? FloatingActionButton(onPressed: action, child: Icon(Icons.add), elevation: 2.0) : null,
      body: body,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (int newIndex) {
            if (newIndex != index) {
              setState(() {
                index = newIndex;
              });
            }
          },
          items: [
            BottomNavigationBarItem(
              label: 'Recipes',
              icon: Icon(Icons.article),
            ),
            BottomNavigationBarItem(
              label: 'Ingredients',
              icon: Icon(Icons.emoji_food_beverage),
            ),
            BottomNavigationBarItem(
              label: 'Shopping List',
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.settings),
            ),
          ]),
    );
  }
}
