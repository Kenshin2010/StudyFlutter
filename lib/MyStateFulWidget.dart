import 'package:flutter/material.dart';


class MyStateFulWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyState();
  }

}

class _MyState extends State<MyStateFulWidget> implements  WidgetsBindingObserver{
  String _email = '';
  final emailController = TextEditingController();

  @override
  void initState() {
    print('On initState');
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    print('On dispose');
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused) {
      print('App is in Background mode');
    } else if(state == AppLifecycleState.resumed) {
      print('App is in Foreground mode');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('On Build');
    // TODO: implement build
    return MaterialApp(
      title: 'This is test flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('My Flutter'), backgroundColor: Colors.blue),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                child: TextField(
                  controller: emailController,
                  onChanged: (text){
                    setState(() {
                      print('On setState');
                      _email = text;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    label: Text('Email your here')
                  ),
                ),
              ),
               const Text('Email result: ', style: TextStyle(color: Colors.black, fontSize: 20)),
               Text('Email result: ${_email}', style: TextStyle(color: Colors.black, fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }





  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}