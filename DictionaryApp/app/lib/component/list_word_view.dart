import 'package:app/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';
import 'package:app/model/word.dart';
import 'package:app/component/item_word.dart';


Widget buildListWordSaved(BuildContext context, DictionaryState state) {

  Word? getDictionaryByIndex(int index, DictionaryState state) {
    return state is DictionaryAllData ? state.words[index] : null;
  }

  int getCountListWord(DictionaryState state) {
    return state is DictionaryAllData ? state.words.length : 0;
  }

  return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: getCountListWord(state),
            itemBuilder: (context, index) {
              return ItemWord(getDictionaryByIndex(index, state)!);
            }),
      ));
}