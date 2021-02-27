import 'package:flutter/material.dart';
import 'package:food_app/view/category_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food App'),
        ),
        body: Center(
          child: Container(
            child: CategoryPage()
          ),
        ),
      ),
    );
  }
}
