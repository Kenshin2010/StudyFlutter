import 'package:app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/bloc/dictionary_state.dart';
import 'package:flutter/material.dart';
import 'package:app/model/dictionary.dart';

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
  if (state is DictionaryDetails) {
    var result = state.result;
    return Wrap(spacing: 20, children: [buildCardWord(result)]);
  } else if (state is DictionaryEmpty) {
    return const BuildTextEmpty();
  } else if(state is DictionaryComplete){
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

Card buildCardWord(Dictionary result) {
  return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.only(left: 20, right: 20, top: 50),
      elevation: 5,
      color: AppColors.white,
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(result.word!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: 24)),
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
          Text(result.mean!,
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
