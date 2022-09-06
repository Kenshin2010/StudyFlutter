import 'package:app/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:app/bloc/dictionary_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/bloc/dictionary_event.dart';
import 'package:flutter/services.dart';
import 'package:app/model/dictionary.dart';

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

Widget buildFloatingSearchBar(BuildContext context, DictionaryState state) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  return floatingSearchBar(isPortrait, context, state);
}

FloatingSearchBar floatingSearchBar(
    bool isPortrait, BuildContext context, DictionaryState state) {
  final myController = FloatingSearchBarController();

  String? getWordByIndex(int index) {
    return state is DictionaryComplete ? state.result[index].word : "";
  }

  Dictionary? getDictionaryByIndex(int index) {
    return state is DictionaryComplete ? state.result[index] : null;
  }

  int getCountListWord() {
    return state is DictionaryComplete ? state.result.length : 0;
  }

  return FloatingSearchBar(
    initiallyHidden: false,
    automaticallyImplyBackButton: false,
    controller: myController,
    queryStyle: const TextStyle(color: Colors.black),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    backgroundColor: Colors.white,
    clearQueryOnClose: true,
    backdropColor: Colors.transparent,
    hint: 'Search world',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 500),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    width: 600,
    debounceDelay: const Duration(milliseconds: 500),
    onQueryChanged: (query) {
      // CFloatingSearchBarall your model, bloc, controller here.
      context.read<DictionaryBloc>().add(OnWordChange(query));
      if (query.trim().isEmpty) {
        myController.close();
      }
    },
    onKeyEvent: (KeyEvent keyEvent) {
      if (keyEvent.logicalKey == LogicalKeyboardKey.escape) {
        myController.query = "";
        myController.close();
      }
    },
    onSubmitted: (val) {
      if (val == "") {
        print(val);
        return;
      } else {}
    },
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: Icon(Icons.bookmark, color: AppColors.primary),
          onPressed: () {
            print("search here");
          },
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        color: AppColors.primary,
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(10)),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: getCountListWord(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: ListTile(
                    title: Text(
                  getWordByIndex(index)!,
                  style: TextStyle(color: AppColors.black, fontSize: 18),
                )),
                onTap: () {
                  var dictionary = getDictionaryByIndex(index);
                  if (dictionary != null) {
                    context
                        .read<DictionaryBloc>()
                        .add(OnWordDetail(dictionary));
                  }
                },
              );
            }),
      );

      // }
      // );
    },
  );
}
