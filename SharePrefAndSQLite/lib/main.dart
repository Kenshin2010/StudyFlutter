import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DataLocalState();
  }
}

class _DataLocalState extends State<MyApp> {
  String? _content = '';
  // final _fo√rmKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadContent();
  }

  //Loading counter value on start
  Future<void> _loadContent() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _content = (prefs.getString('content') ?? '');
    });
  }

  //Loading counter value on start
  Future<void> _setContent() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('content', _content ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo data local',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Data local'),
            ),
            body: Form(
                child: Container(
                    // key: _formKey,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.symmetric(vertical: 100)),
                        TextFormField(
                          style: TextStyle(fontSize: 30),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            _content = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter content";
                            }
                          },
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                        ElevatedButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                              _setContent();
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          child:
                              Text('Save data', style: TextStyle(fontSize: 38)),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                        Text(
                          'Data in here: $_content',
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    )))));
  }
}
