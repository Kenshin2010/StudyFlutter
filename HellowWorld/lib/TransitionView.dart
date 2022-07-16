import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'transition.dart';
import 'TransitionList.dart';

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
  List<Transaction> _transitions = <Transaction>[];
  Transaction transaction = Transaction();

  void addItem(){
    setState((){
      _transitions.add(transaction);
    });
    _scaffoldKey.currentState?.showSnackBar(
        SnackBar(
          content: Text('Content = $_buy, money\'s amount = $_amount'),
          duration: Duration(seconds: 3),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Demo TextField",
      home: Scaffold(
        key: _scaffoldKey,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            addItem();
          },
          tooltip: "Add item",
          elevation: 10,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
                addItem();
            }, icon: Icon(Icons.add))
          ],
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
                    transaction.content = _buy;
                  }),
              TextField(
                  controller: _amountController,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(label: Text('Amount')),
                  maxLines: 1,
                  onChanged: (text) {
                    setState((){
                      _amount = int.parse(text);
                      transaction.amount = _amount;
                    });
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.pinkAccent, onPrimary: Colors.white),
                  onPressed: () {
                    addItem();
                  },
                  child: Text('Buy now 2',
                      style: TextStyle(color: Colors.white, fontSize: 20))),
              TransitionList(transitonList: _transitions)
            ],
          ),
        ),
      ),
    );
  }
}

