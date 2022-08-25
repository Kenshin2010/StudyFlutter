import 'package:app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/bloc/dictionary_state.dart';
import 'package:app/bloc/dictionary_bloc.dart';
import 'package:app/bloc/dictionary_event.dart';
import 'package:flutter/material.dart';

Widget buildBackgroundView(BuildContext context, DictionaryState state) {
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
    child: handleStateView(state),
  );
}

Widget buildLoadingView() {
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    const CircularProgressIndicator(),
    const SizedBox(height: 10),
    Text("Loading",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            fontSize: 18))
  ]);
}

Widget handleStateView(DictionaryState state) {
  if (state is DictionaryLoading) {
    return buildLoadingView();
  } else if (state is DictionaryHasData) {
    return Center(
        child: Text("Has data",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontSize: 18)));
  } else {
    return Center(
        child: Text("Empty data. Please enter word",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontSize: 18)));
  }
}
