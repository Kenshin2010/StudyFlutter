import 'package:app/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';
import 'package:app/model/word.dart';
import 'package:app/component/item_word.dart';
import 'package:app/constants/constants.dart';

//
// class ListWordView extends StatefulWidget{
//   DictionaryState state;
//   ListWordView(this.state);
//
//   @override
//   State<StatefulWidget> createState() {
//     return ListWordState(state);
//   }
//
// }
//
// class ListWordState extends State{
//   DictionaryState state;
//   ListWordState(this.state);
//   List<Word> list = List.empty();
//
//   @override
//   void initState() {
//     super.initState();
//     if(state is DictionaryAllData){
//       list = (state as DictionaryAllData).words;
//     }else if(state is DictionarySave){
//       Word word = (state as DictionarySave).result;
//       int index = list.indexOf(word);
//       list.removeAt(index);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return buildListWordSaved(context, state);
//   }
//
// }

Widget buildListWordSaved(BuildContext context, List<Word> list) {

  // Word? getDictionaryByIndex(int index, DictionaryState state) {
  //   return state is DictionaryAllData ? state.words[index] : null;
  // }
  //
  // int getCountListWord(DictionaryState state) {
  //   return state is DictionaryAllData ? state.words.length : 0;
  // }
  //
  // List<Word> getListWord(){
  //   return state is DictionaryAllData ? state.words : List.empty();
  // }

  // Word? getIndexById(){
  //   if(word != null){
  //
  //   }
  // }

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