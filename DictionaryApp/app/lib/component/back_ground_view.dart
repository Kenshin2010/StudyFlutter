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

Widget handleStateView(DictionaryState state) {
  if (state is DictionaryComplete) {
    return Text("Empty data. Please enter word",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            fontSize: 18));
  } else if (state is DictionaryEmpty) {
    return Wrap(
      spacing: 20,
      children: [buildCardWord()],
    );
  } else {
    return SizedBox();
  }
}

Card buildCardWord() {
  return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
      elevation: 5,
      color: AppColors.white,
      child: Column(
        children: [
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hello",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 18)),
              SizedBox(width: 10),
              Text('/dasdsada/',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: AppColors.black,
                      fontSize: 16))
            ],
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Icon(Icons.copy, color: AppColors.primary, size: 24.0),
                  SizedBox(height: 15),
                  Text(
                    'Copy',
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Icon(Icons.volume_up_rounded,
                      color: AppColors.primary, size: 24.0),
                  SizedBox(height: 15),
                  Text(
                    'Hear',
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Icon(Icons.bookmark_added_rounded,
                      color: AppColors.primary, size: 24.0),
                  SizedBox(height: 15),
                  Text(
                    'Save',
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: [
                  Icon(Icons.share_rounded,
                      color: AppColors.primary, size: 24.0),
                  SizedBox(height: 15),
                  Text(
                    'Share',
                    style: TextStyle(color: AppColors.primary, fontSize: 16),
                  )
                ],
              )),
            ],
          ),
          SizedBox(height: 30),
          Text(
              "I've no idea what time the train leaves. Ask the guard whether he knows",
              style: TextStyle(color: AppColors.primary),
              textAlign: TextAlign.center),
          SizedBox(height: 30)
        ],
      ));
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
