import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


//search package: https://pub.dev/
// hot reload
// template source: https://flutterstudio.app/

void main() => runApp(MyApp());












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