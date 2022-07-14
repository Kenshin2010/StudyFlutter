import 'package:flutter/material.dart';
class Transaction {
  String content;
  int amount;
  //constructor
  Transaction({this.content = '', this.amount = 0});
  @override
  String toString() {
    // TODO: implement toString
    return 'content: $content, amount: $amount';
  }
}