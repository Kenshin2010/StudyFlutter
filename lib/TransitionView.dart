import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransitionView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransitionState();
  }
}

class TransitionState extends State<TransitionView> {
  String _buy = '';
  int _amount = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _buyController = new TextEditingController();
  TextEditingController _amountController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Demo TextField",
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            title: Text("Transition"), backgroundColor: Colors.blueAccent),
        body: SafeArea(
          minimum: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              TextField(
                controller: _buyController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(label: Text('Buy')),
                  maxLines: 1,
                  onChanged: (text) {
                    _buy = text;
                  }),
              TextField(
                  controller: _amountController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(label: Text('Amount')),
                  maxLines: 1,
                  onChanged: (text) {
                    setState((){
                      _amount = int.parse(text);
                    });
                  }),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent, onPrimary: Colors.white),
                  onPressed: () {
                    _scaffoldKey.currentState?.showSnackBar(
                        SnackBar(
                          content: Text('Content = $_buy, money\'s amount = $_amount'),
                          duration: Duration(seconds: 3),
                        )
                    );
                  },
                  child: Text('Buy now',
                      style: TextStyle(color: Colors.white, fontSize: 20)))
            ],
          ),
        ),
      ),
    );
  }
}

