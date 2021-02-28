import 'package:flutter/material.dart';
import 'package:food_app/screen/category/components/category_item.dart';
import 'package:food_app/fake_data.dart';

class CategoryPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView(
      children: categories.map((category) => CategoryItem(category: category)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        childAspectRatio: 3/2,
      ),
    );
  }

}