import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

@Deprecated("Không dùng view này nữa")
class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchViewState();
  }
}

class SearchViewState extends State<SearchView> {
  final _myController = TextEditingController();

  @override
  void dispose() {
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
          controller: _myController,
          style: TextStyle(color: AppColors.primary),
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              suffixIcon: IconButton(
                  icon: Icon(Icons.clear, color: AppColors.primary),
                  onPressed: () {
                    _myController.text = '';
                  }),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              hintText: 'Search world')),
    );
  }
}

Widget buildFloatingSearchBar() {
  return FloatingSearchBar(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    backgroundColor: Colors.white,
    clearQueryOnClose: true,
    backdropColor: Colors.transparent,
    hint: 'Search world',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    openAxisAlignment: 0.0,
    width: 600,
    debounceDelay: const Duration(milliseconds: 500),
    onQueryChanged: (query) {
      // CFloatingSearchBarall your model, bloc, controller here.
    },
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: Icon(Icons.bookmark, color: AppColors.primary),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        color: AppColors.primary,
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Text('Text'),
      );
    },
  );
}