import 'package:app/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';
import 'package:app/model/word.dart';
import 'package:app/component/item_word.dart';
import 'package:app/constants/constants.dart';

Widget buildListWordSaved(BuildContext context, List<Word> list) {

  return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return buildCardWord(list[index], context, Constants.SAVED_SCREEN);
            }),
      ));
}