import 'package:app/bloc/dictionary_bloc.dart';
import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app/component/search_view.dart';
import 'package:app/component/content_search.dart';
import 'package:app/bloc/dictionary_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();

  }

}

class SearchScreenState extends State<SearchScreen>{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryBloc, DictionaryState>(
        builder: (context, state) {
          return  Stack(children: [
            buildContent(context, state),
            buildFloatingSearchBar(context, state)
          ]);
        }
    );



  }

}
