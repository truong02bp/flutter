import 'package:flutter/material.dart';
import 'package:food_app/model/Category.dart';
import 'package:food_app/model/Food.dart';
import 'package:food_app/fake_data.dart';

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
      body: Center(child: Image.network('${list[0].imageUrl}')),
    );
  }
}
