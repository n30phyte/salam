import 'dart:collection';

class Recipe {
  String name;
  HashMap<Ingredient, IngredientQuantity> ingredients;

  Recipe();
}

class IngredientQuantity {}

class Ingredient {
  String name;
}
