import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app/component/search_view.dart';

class SearchScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SearchScreenState();

  }

}

class SearchScreenState extends State<SearchScreen>{
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      buildFloatingSearchBar(context)
    ]);
  }

}
