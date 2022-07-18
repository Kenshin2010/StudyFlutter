import 'dart:math';
import 'category.dart';
import 'package:flutter/cupertino.dart';

class Food {
  late int id;
  String name;
  String urlImage;
  Duration duration; //time to finish this food
  Complexity complexity;
  //one foods has many ingredients
  List<String> ingredients = <String>[];
  //reference: 1 Category has many Foods
  late int categoryId;
  //constructor:
  Food(
      {required this.name,
      required this.urlImage,
      required this.duration,
      required this.complexity,
      required this.ingredients,
      this.categoryId = 0}) {
    id = Random().nextInt(1000);
    //id is "auto-increment"
  }
}

enum Complexity { Simple, Medium, Hard }
