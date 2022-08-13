import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw MaterialApp(
      title: "My Dictionary",
      debugShowCheckedModeBanner: false,
      home: Scaffold(

      ),
    );
  }

}