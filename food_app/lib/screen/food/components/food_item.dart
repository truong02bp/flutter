import 'package:flutter/material.dart';
import 'package:food_app/constants/routes.dart';
import 'package:food_app/model/Food.dart';

class FoodItem extends StatelessWidget {

  final Food food;


  FoodItem({this.food});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.FOOD_DETAIL, arguments: {'food' :  food});
      },
      splashColor: Colors.pinkAccent,
      child: Stack(children: [
        Container(
          padding: EdgeInsets.all(15),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/loading.gif',
                image: food.imageUrl),
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black54
            ),
            child: Row(children: [
              Icon(
                Icons.timer,
                color: Colors.white,
              ),
              Padding(padding: EdgeInsets.only(right: 5)),
              Text('${food.duration.inMinutes} minutes', style: TextStyle(color: Colors.white),)
            ],),
          ),
        ),
        Positioned(
          top: 30,
          right: 30,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black54
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellowAccent,),
                Padding(padding: EdgeInsets.only(right: 5)),
                Text('${food.complexity.toString().split(".").last}', style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black54
            ),
            padding: EdgeInsets.only(left: 15, right: 15, top: 2, bottom: 5),
            child: Row(
              children: [
                Text('${food.name}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),)
              ],
            ),
          ),
        )
      ]),
    );
  }

}