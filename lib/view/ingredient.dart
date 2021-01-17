import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/ingredient.dart';

class NewIngredientState extends StatefulWidget {
  static const routeName = '/ingredient/new';

  @override
  State<StatefulWidget> createState() {
    return _NewIngredientScreen();
  }
}

class _NewIngredientScreen extends State<NewIngredientState> {
  @override
  Widget build(BuildContext context) {
    Ingredient newIngredient;
    IngredientType newType;
    final ingredientController = TextEditingController();

    return Scaffold(
        appBar: AppBar(title: Text('New Ingredient')),
        body: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                      hintText: 'Ingredient Name',
                    )),
                    flex: 5,
                  ),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                        hintText: 'Qty',
                      )),
                      flex: 2),
                  Expanded(
                      child: DropdownButton(
                          items: <DropdownMenuItem>[
                            DropdownMenuItem(child: Text('Volume')),
                            DropdownMenuItem(child: Text('Mass'))
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              if (newValue == 'Volume') {
                                newType = IngredientType.Volume;
                              } else {
                                newType = IngredientType.Mass;
                              }
                            });
                          }),
                      flex: 2),
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Subtype',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Brand',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Add'),
              )
            ],
          ),
        ));
  }
}
