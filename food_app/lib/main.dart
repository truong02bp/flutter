import 'package:flutter/material.dart';
import 'package:food_app/constants/routes.dart';
import 'package:food_app/screen/category/category_page.dart';
import 'package:food_app/screen/food/food_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        fontFamily: 'Itim',
        primaryColor: Colors.pinkAccent,
      ),
      initialRoute: Routes.ROOT_PAGE,
      routes: {
        Routes.FOOD_PAGE : (context) => FoodPage(),
        Routes.CATEGORY_PAGE : (context) => CategoryPage()
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food Application'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(child: CategoryPage()),
        ),
      ),
    );
  }
}
