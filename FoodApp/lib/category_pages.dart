
import 'package:flutter/material.dart';
import 'package:foodproject/CategoryItem.dart';
import 'fake_data.dart';

class CategoryPage extends StatelessWidget{
  static const String route = '/CategoryPage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView(
      padding: EdgeInsets.all(10),
      children: FAKE_CATEGORIES.map((item) => CategoryItem(category: item)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
    );
  }

}