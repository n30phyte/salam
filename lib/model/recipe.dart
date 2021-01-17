import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'ingredient.dart';

class Recipe {
  String name;

  List<Ingredient> ingredients = [Ingredient('Cheese'), Ingredient('Egg')];

  HashMap<String, IngredientQuantity> ingredientQuantities;

  Recipe(this.name);
}

class RecipeListModel extends ChangeNotifier {
  List<Recipe> recipeList = [];

  void addRecipe(Recipe newRecipe) {
    // Add ingredients into ingredientList
    recipeList.add(newRecipe);
    notifyListeners();
  }
}
