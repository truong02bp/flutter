import 'package:flutter/material.dart';
import 'package:food_app/model/Category.dart';

class CategoryItem extends StatelessWidget{

  Category category;


  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${category.content}'),
        ],
      ),
    );
  }

}