
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            SearchView(),
            const SizedBox(height: 80),
            const Image(image: AssetImage('assets/welcome.png')),
            const SizedBox(height: 50),
            Text('Write the name of a city to know the weather \n in that city!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white.withOpacity(0.5)
            ))
          ],
        )
      ],
    );
  }

}