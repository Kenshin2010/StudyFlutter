import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'calculation.dart';
import 'car.dart';
import 'TransitionView.dart';

import 'MyStateFulWidget.dart';

//search package: https://pub.dev/
// hot reload
// template source: https://flutterstudio.app/

void main() {
runApp(TransitionView());


//   numberToString.forEach((element) {
//     print(element);
//   });
//
//   numbers.forEach((item) {
//     print(item);
//   });
//
//   var car = Car(year: 2020, name: "Ferrari");
//
//   List<Car> data = [
//     Car(year: 2020, name: "Ferrari"),
//     Car(year: 2020, name: "Ferrari"),
//     Car(year: 2020, name: "Ferrari")
//   ];
//
//   runApp(Center(
//       child: Text(/*s1+ s2*/ /*'$x'*/ /*'$numbers'*/ car.name,
//           textDirection: TextDirection.ltr,
//           style: const TextStyle(fontSize: 20.0, color: Colors.blue))));
// }
// //
// void main() => runApp(  Center(
//
//   child: Text( /*s1+ s2*/     /*'$x'*/    '$numbers',
//       textDirection: TextDirection.ltr,
//       style: TextStyle(fontSize: 20.0, color: Colors.blue))
// ));

// class Demo extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Text("hihi",
//           textDirection: TextDirection.ltr,
//           style: TextStyle(fontSize: 18,
//               color: Colors.blue)),
//     );
//   }
//
// }

// class Gesture extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return GestureDetector(
//       onTap: (){
//         print("Item click");
//       },child: const Center(
//         child: Text("Test here hihi hasha", textDirection: TextDirection.ltr),
//       ),
//     );
//   }
//
// }

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Test List View")
//       ),
//         body: const Center(
//           child: CustomListView(),
//         ),
//     ));
//   }
//
// }
//
// class CustomListView extends StatefulWidget {
//   const CustomListView({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return ListItemState();
//   }
// }
//
// class ListItemState extends State<CustomListView> {
//
//   final List<WordPair> _word = <WordPair>[];
//   final _biggerFont = const TextStyle(fontSize: 18);
//   final Set<WordPair> _saved = <WordPair>{};
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ListView.builder(itemBuilder: (context, index) {
//           if (index.isOdd) return const Divider();
//           if (index >= _word.length) {
//             _word.addAll(generateWordPairs().take(10));
//           }
//           return _buildRow(_word[index]);
//         }),
//       ),
//     );
//   }
//
//   Widget _buildRow(WordPair wordPair) {
//     final bool already = _saved.contains(wordPair);
//     return ListTile(
//         title: Text(
//           wordPair.asPascalCase,
//           style: _biggerFont),
//         trailing: Icon(already ? Icons.favorite : Icons.favorite_border,
//             color: already ? Colors.red : null),
//       onTap: (){
//           setState((){
//             if(already){
//               _saved.remove(wordPair);
//             }else{
//               _saved.add(wordPair);
//             }
//           });
//       },
//
//     );
//   }
//
// }

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: "Test",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("ListView"),
//           backgroundColor: Colors.blue,
//         ),
//         body: Center(
//           child: ListStaticItem(),
//         ),
//       ),
//     );
//   }
//
// }

// class ListStaticItem extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: const <Widget>[
//         ListTile(title: Text("hihi")),
//         ListTile(title: Text("hihi")),
//         ListTile(title: Text("hihi")),
//         ListTile(title: Text("hihi")),
//       ],
//     );
//   }
//
// }

// class TextChange extends StatefulWidget{
//
//   @override
//   State<StatefulWidget> createState() {
//     return TextState();
//   }
// }
//
// class TextState extends State<TextChange>{
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     return MaterialApp(
//       title:  "StatefullWidget",
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("test UI"),
//           leading: IconButton(
//             icon: Icon(Icons.notifications_active), onPressed: () {  },
//           ),
//         ),
//         body: Center(
//           child: Text(wordPair.asUpperCase),
//         ),
//       ),
//     );
//   }
//
// }

// class MyApp extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('test'),
//           backgroundColor: Colors.blue,
//         ),
//         backgroundColor: Colors.redAccent,
//         body: Container(),
//       ),
//     ) ;
//     throw UnimplementedError();
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Example'),
//           backgroundColor: Colors.blueGrey[900],
//         ),
//         backgroundColor: Colors.white,
//         body: Container(),
//       ),
//     );
//   }
// }
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     final wordPair = WordPair.random();
//     return MaterialApp(
//       title: "Welcome to Flutter",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Welcome to Flutter 12323"),
//         ),
//         body: Center(
//           // child: Text.rich(
//           //   TextSpan(
//           //     children: [
//           //       TextSpan(text: wordPair.asUpperCase , style: TextStyle(fontStyle: FontStyle.italic)),
//           //       TextSpan(text: " - ", style: TextStyle(fontWeight: FontWeight.bold)),
//           //       TextSpan(text: wordPair.asUpperCase , style: TextStyle(fontWeight: FontWeight.bold)),
//           //     ]
//           //   )
//           // ),
//           child: Image.asset('assets/album.png')
//
//         ),
//       ),
//     );
//   }
//
// }

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
}
