import 'package:app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';
import 'package:app/model/word.dart';
import 'package:app/bloc/dictionary_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/bloc/dictionary_event.dart';
import 'package:app/component/item_word.dart';

Widget buildContent(BuildContext context, DictionaryState state) {
  return Container(
    width: double.infinity,
    height: double.maxFinite,
    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
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
    ),
    child: handleStateView(state, context),
  );
}

Widget handleStateView(DictionaryState state, BuildContext context) {
  if (state is DictionaryDetails) {
    var result = state.result;
    return Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [const SizedBox(height: 30), ItemWord(result)]),
        ));
  } else if (state is DictionaryEmpty) {
    return const BuildTextEmpty();
  } else if (state is DictionaryComplete) {
    return const BuildTextSelectWord();
  } else {
    return const SizedBox();
  }
}

class BuildTextEmpty extends StatelessWidget {
  const BuildTextEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Empty data.\n Please enter the word",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontSize: 18)),
    );
  }
}

class BuildTextSelectWord extends StatelessWidget {
  const BuildTextSelectWord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Choose a word to see details",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontSize: 18)),
    );
  }
}

Widget buildLoadingView() {
  return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    const CircularProgressIndicator(),
    const SizedBox(height: 10),
    Text("Loading",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            fontSize: 18))
  ]);
}
