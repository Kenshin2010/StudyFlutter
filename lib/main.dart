import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


//search package: https://pub.dev/
// hot reload
// template source: https://flutterstudio.app/
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Flutter 12323"),
        ),
        body: Center(
          child: Text(wordPair.asUpperCase),
        ),
      ),
    );
  }

}