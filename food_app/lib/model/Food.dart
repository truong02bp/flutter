import 'dart:math';

import 'package:food_app/constants/Complexity.dart';

class Food {

  int id;
  String name;
  String imageUrl;
  Duration duration;
  Complexity complexity;
  List<String> ingredients = List();
  int categoryId;

  Food(
      {this.name,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.ingredients,
      this.categoryId}){
    this.id = Random(1).nextInt(999);
  }

}