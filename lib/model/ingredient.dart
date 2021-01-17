import 'package:flutter/foundation.dart';
import 'package:string_similarity/string_similarity.dart';

class IngredientQuantity {}

class Ingredient {
  final String name;

  Ingredient(this.name);
}

class IngredientListModel extends ChangeNotifier {
  static List<Ingredient> knownIngredients = [];
  static List<String> ingredientNames = [];

  void addIngredient(Ingredient newIngredient) {
    if (!ingredientNames.contains(newIngredient.name)) {
      ingredientNames.add(newIngredient.name);
      knownIngredients.add(newIngredient);
    }
  }

  static List<String> getSuggestions(String text) {
    // Get matches
    if (ingredientNames.isEmpty) {
      return [];
    }

    var scores = text.bestMatch(ingredientNames).ratings;

    // Filter for best
    var best = scores.where((match) => match.rating >= 0.5).map((match) => match.target);

    return best;
  }
}
