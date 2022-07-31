
import 'package:flutter/material.dart';
import 'package:source_app/theme/app_colors.dart';
import '../component/search_view.dart';

class SearchHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchHome>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: AppColors.bgGradient,
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft))
        ),
        Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
            SearchView(),

          ],
        )
      ],
    );
  }

}