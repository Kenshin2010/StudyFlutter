import 'package:flutter/material.dart';
import 'package:foodproject/foods_page.dart';
import 'category_pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Food App',
      initialRoute: '/',
      routes: {
        FoodsPage.routeName : (context) => FoodsPage(),
        CategoryPage.route : (context) => CategoryPage()
      },
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        // fontFamily: 'Parisienne',
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Trajan Pro'),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('List Food', style: TextStyle(fontFamily: 'Parisienne'),),
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        body: SafeArea(child: CategoryPage()),
      ),
    );
  }
}
