import 'package:flutter/material.dart';
import 'package:food_app/model/Food.dart';

class FoodDetail extends StatelessWidget {
  Food food;

  FoodDetail({@required this.food});

  @override
  Widget build(BuildContext context) {
    Map<String, Food> arguments = ModalRoute.of(context).settings.arguments;
    this.food = arguments['food'];
    List<String> ingredients = food.ingredients;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '${food.name}',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif', image: food.imageUrl),
              ),
            ),
            Text('Ingredients : '),
            ListView.builder(
                itemCount: ingredients.length,
                itemBuilder: (context, index) {
                  String ingredient = ingredients[index];
                  return ListTile(
                    leading: Text('${food.id + 1}'),
                    title: Text('${ingredient}'),
                  );
                })
          ],
        ));
  }
}
