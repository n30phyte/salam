import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class NewRecipeScreen extends StatefulWidget {
  static const routeName = '/recipe/new';

  @override
  State<StatefulWidget> createState() {
    return _NewRecipeScreen();
  }
}

class _NewRecipeScreen extends State<NewRecipeScreen> {
  var ingredientList = <String>[];
  var stepsList = <String>[];

  @override
  Widget build(BuildContext context) {
    final stepController = TextEditingController();

    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: RenameAppBarState('New Recipe'),
            body: TabBarView(children: [
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        if (index >= ingredientList.length) {
                          var _controller = TextEditingController();
                          Widget widget = TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.add_circle),
                                    onPressed: () {
                                      setState(() {
                                        if (ingredientList.length <= index) {
                                          ingredientList.add(_controller.text);
                                        }
                                      });
                                    })),
                          );
                          return widget;
                        } else {
                          var _controller = TextEditingController(text: ingredientList[index]);
                          Widget widget = TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_circle),
                                    onPressed: () {
                                      setState(() {
                                        ingredientList.removeAt(index);
                                      });
                                    })),
                          );
                          return widget;
                        }
                      },
                      itemCount: ingredientList.length + 1,
                    )),
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: stepController,
                      onSubmitted: (text) {
                        stepsList.add(text);
                      },
                    )),
              )
            ])));
  }
}

class RenameAppBarState extends StatefulWidget implements PreferredSizeWidget {
  final String defaultText;

  RenameAppBarState(this.defaultText);

  @override
  State<StatefulWidget> createState() {
    return _RenameAppBarWidget(defaultText);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _RenameAppBarWidget extends State<RenameAppBarState> {
  String appBarText;

  _RenameAppBarWidget(this.appBarText);

  @override
  Widget build(BuildContext context) {
    var _textFieldController = TextEditingController();

    return GestureDetector(
      child: AppBar(title: Text(appBarText), bottom: TabBar(tabs: [Tab(text: 'Ingredients'), Tab(text: 'Directions')])),
      onDoubleTap: () {
        AlertDialog(
            title: Text('Please enter the name of the recipe'),
            content: TextField(
              onChanged: (String value) {
                setState(() {
                  appBarText = value;
                });
              },
              controller: _textFieldController,
            ));
      },
    );
  }
}
