import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/ingredient.dart';

class NewIngredientScreen extends StatelessWidget {
  static const routeName = '/ingredient/new';

  @override
  Widget build(BuildContext context) {
    var ingredientList = <Ingredient>[];

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
                    flex: 3,
                  ),
                  Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                        hintText: 'Qty',
                      )),
                      flex: 1),
                  Expanded(
                      child: DropdownButtonFormField(items: <DropdownMenuItem>[
                        DropdownMenuItem(child: Text('Weight')),
                        DropdownMenuItem(child: Text('Volume'))
                      ], onChanged: null),
                      flex: 1),
                ],
              ),
            ],
          ),
        ));
  }
}
