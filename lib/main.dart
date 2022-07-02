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
          // child: Text.rich(
          //   TextSpan(
          //     children: [
          //       TextSpan(text: wordPair.asUpperCase , style: TextStyle(fontStyle: FontStyle.italic)),
          //       TextSpan(text: " - ", style: TextStyle(fontWeight: FontWeight.bold)),
          //       TextSpan(text: wordPair.asUpperCase , style: TextStyle(fontWeight: FontWeight.bold)),
          //     ]
          //   )
          // ),
          child: Image.asset('assets/album.png')

        ),
      ),
    );
  }

}


// class MyHomePage extends StatelessWidget {
//   MyHomePage({ Key? key, required this.title}) : super(key: key);
//
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(this.title), ),
//       body: Center(child: Text( 'Hello World',)),
//     );
//   }
// }