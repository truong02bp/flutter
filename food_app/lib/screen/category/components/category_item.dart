import 'package:flutter/material.dart';
import 'package:food_app/constants/routes.dart';
import 'package:food_app/model/Category.dart';

class CategoryItem extends StatelessWidget{

  Category category;


  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.FOOD_PAGE , arguments: {'category' : this.category});
      },
      splashColor: Colors.blueAccent,

      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${category.content}', style: TextStyle(fontSize: 17),),
          ],
        ),
      ),
    );
  }

}