import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../model/ingredient.dart';
import '../model/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const routeName = '/recipe/view';

  ListView generateIngredientList(Recipe recipe) {
    return ListView(children: [
      for (var ingredient in recipe.ingredients)
        CheckboxListTile(
          title: Text(ingredient.name),
          onChanged: null,
          value: true,
        )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = ModalRoute.of(context).settings.arguments;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text(recipe.name), bottom: TabBar(tabs: [Tab(text: 'Ingredients'), Tab(text: 'Directions')])),
            body: TabBarView(children: [generateIngredientList(recipe), Text('Dir ${recipe.name}')])));
  }
}

class NewRecipeScreen extends StatelessWidget {
  static const routeName = '/recipe/new';

  @override
  Widget build(BuildContext context) {
    var ingredientList = <Ingredient>[];

    final ingredientController = TextEditingController();

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text('New Recipe'), bottom: TabBar(tabs: [Tab(text: 'Ingredients'), Tab(text: 'Directions')])),
            body: TabBarView(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      child: Column(children: <Widget>[
                    TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: ingredientController, decoration: InputDecoration(labelText: 'Ingredient Name')),
                      suggestionsCallback: (text) {
                        return IngredientListModel.getSuggestions(text);
                      },
                      itemBuilder: (context, String suggestion) {
                        return ListTile(title: Text(suggestion));
                      },
                      onSuggestionSelected: (String suggestion) {
                        ingredientController.text = suggestion;
                      },
                    )
                  ])),
                ),
              ),
              TextField(
                controller: ingredientController,
                onSubmitted: (text) {
                  ingredientList.add(Ingredient(text));
                },
              )
            ])));
  }
}
