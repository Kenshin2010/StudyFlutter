import 'package:flutter/material.dart';
import 'fake_data.dart';
import 'models/category.dart';
import 'models/food.dart';

class FoodsPage extends StatelessWidget {
  static const String routeName = '/FoodsPage';
  late Category category;
  FoodsPage({Category? category});

  @override
  Widget build(BuildContext context) {
    Map<String, Category> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Category>;
    category = arguments['category']!;
    List<Food> foods = FAKE_FOODS
        .where((food) => food.categoryId == this.category.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Foods from ${category.content}'),
      ),
      body: Center(
          child: Center(
        child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        clipBehavior: Clip.hardEdge,
                        child: Center(
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading.gif',
                              image: foods[index].urlImage),
                        )),
                  ),
                  Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(Icons.timer, color: Colors.white,),
                              Padding(padding: EdgeInsets.all(2)),
                              Text(
                                '${foods[index].duration.inMinutes} minutes',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ); //We will continue in the next lesson
            }),
      )),
    );
  }
}
