import 'package:flutter/material.dart';
import 'package:food_app/model/Category.dart';
import 'package:food_app/model/Food.dart';
import 'package:food_app/fake_data.dart';
import 'package:food_app/screen/food/components/food_item.dart';

class FoodPage extends StatelessWidget {
  Category category;

  FoodPage({this.category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments = ModalRoute.of(context).settings.arguments;
    this.category = arguments['category'];
    List<Food> list =
        foods.where((element) => element.categoryId == category.id).toList();
    print(list[0].imageUrl);
    return Scaffold(
        appBar: AppBar(
          title: Text('This is food page'),
        ),
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              Food food = list[index];
              return FoodItem(food: food,);
            }));
  }
}
