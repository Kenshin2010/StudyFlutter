import 'package:flutter/material.dart';
import 'package:source_app/theme/app_themes.dart';
import '../theme/app_colors.dart';

class SearchView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }
}

class SearchState extends State<SearchView> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
        Flexible(
            flex: 1,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(20)),
              child: TextField(
                controller: myController,
                cursorColor: AppColors.lightPurple,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.white),
                      onPressed: () {
                        myController.text = '';
                      }),
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            )),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
        ElevatedButton(
            // OutlineButton neu khong muon setBackgroundButton
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: AppColors.primary)))),
            child: Text(
              'Go',
              style: TextStyle(color: AppColors.white, fontSize: 16),
            )),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
      ],
    );
  }
}
