import 'package:flutter/material.dart';

class Car {
  late String name;
  late int year;

  // Car(this.name, this.year);

  Car({required this.name, this.year = 2020});
}
