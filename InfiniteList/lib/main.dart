import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list/bloc/comment_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_list/widget/inifinite_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Infinite List',
        home: Scaffold(
            appBar: AppBar(title: Text('Infinite List View')),
            body: BlocProvider(
              create: (_) => CommentBloc(httpClient: http.Client())..add(CommentFetched()),
                child: const Center(
                  child: InfiniteList(),
                ),)
        ));
  }
}




