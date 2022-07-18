import 'package:flutter/material.dart';
import 'package:foodproject/models/food.dart';

class DetailsFoodPage extends StatelessWidget {
  Food food;
  DetailsFoodPage({required this.food});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Details food app',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text('Pizza detals'),
        ),
        body: Container(
          child: Column(
            children: [
              FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: food.urlImage),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              const Text(
                'Ingredients',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Expanded(child: ListView.builder(
                  itemCount: food.ingredients.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.lightBlueAccent,
                        child: Text('#${index+1}', style: TextStyle(fontSize: 19, color: Colors.black)),
                      ),
                      title: Text(food.ingredients[index], style: TextStyle(fontSize: 22),),
                    );
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
