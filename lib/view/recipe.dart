import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../model/recipe.dart';

class RecipeListScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    List<Recipe> recipeList;

    context.select((RecipeListModel rlm) => recipeList = rlm.recipeList);

    return Scaffold(
        appBar: AppBar(title: Text('Recipes')),
        endDrawerEnableOpenDragGesture: true,
        drawer: SafeArea(
            child: Drawer(
                child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(title: Text('Recipes'), onTap: () {}),
            ListTile(title: Text('Ingredients'), onTap: () {}),
            ListTile(title: Text('Shopping List'), onTap: () {})
          ],
        ))),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, NewRecipeScreen.routeName);
            },
            child: Icon(Icons.add),
            elevation: 2.0),
        body: ListView(children: [
          for (var recipe in recipeList)
            ListTile(
                title: Text(recipe.name),
                onTap: () {
                  Navigator.pushNamed(context, RecipeDetailsScreen.routeName, arguments: recipe);
                })
        ]));
  }
}

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
    var ingredientList = [];

    final ingredientController = TextEditingController();

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text('New Recipe'), bottom: TabBar(tabs: [Tab(text: 'Ingredients'), Tab(text: 'Directions')])),
            body: TabBarView(children: [
              TextField(
                controller: ingredientController,
                onSubmitted: (text) {},
              ),
              TextField(
                controller: ingredientController,
                onSubmitted: (text) {},
              )
            ])));
  }
}
