import 'package:flutter/material.dart';
import 'blocs/counter_bloc.dart';
import '../events/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.read<CounterBloc>();
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, counter){ //"counter" is "new state"
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Two actions/events here:", style: TextStyle(fontSize: 25),),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.greenAccent),
                    child: FlatButton(
                      child: const Text("Increment(+)",
                        style: TextStyle(fontSize: 16, color: Colors.black),),
                      onPressed: () {
                        //How to send event to Bloc ?
                        counterBloc.add(CounterEvent.increment);
                      },
                    ),
                  ),
                  Text('Result : $counter', style: TextStyle(fontSize: 40, color: Colors.blue),),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.redAccent),
                    child: FlatButton(
                      child: const Text("Decrement(-)",
                        style: TextStyle(fontSize: 16, color: Colors.black),),
                      onPressed: () {
                        counterBloc.add(CounterEvent.decrement);
                      },
                    ),
                  ),

                ],
              );
            },)
      ),
    );
  }
}