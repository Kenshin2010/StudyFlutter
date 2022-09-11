import 'package:app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:app/bloc/dictionary_state.dart';
import 'package:app/bloc/dictionary_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/component/item_word.dart';
import 'package:app/component/list_word_view.dart';
import 'package:app/model/word.dart';
import 'package:app/bloc/dictionary_event.dart';

class SavedScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SavedState();
  }
}

class SavedState extends State {
  Word? getDictionaryByIndex(int index, DictionaryState state) {
    return state is DictionaryAllData ? state.words[index] : null;
  }

  int getCountListWord(DictionaryState state) {
    return state is DictionaryAllData ? state.words.length : 0;
  }

  @override
  void initState() {
    context.read<DictionaryBloc>().add(const onGetListSaved());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionaryBloc, DictionaryState>(
        builder: (context, state) {
      return Stack(children: [
        buildBackgroundView(context),
        buildListWordSaved(context, state)
      ]);
    });
  }

  Widget buildListWordSaved(BuildContext context, DictionaryState state) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: buildListWordSaved(context, state));
  }

  Widget buildBackgroundView(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.maxFinite,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              //  Đổ bóng cho Container view
              color: AppColors.gray,
              blurRadius: 15.0,
            ),
          ],
        ));
  }
}
