
import 'package:app/bloc/dictionary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app/model/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/bloc/dictionary_event.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';

Card buildCardWord(Word result, BuildContext context, int screen) {
  return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.all(20),
      elevation: 5,
      color: AppColors.white,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(result.word!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                  fontSize: 24)),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(child: InkWell(
                onTap: () async {
                  Clipboard.setData(ClipboardData(text: result.word!)).then((_){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Word copied to clipboard")));
                  });
                  // copied successfully
                },
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Icon(Icons.copy, color: AppColors.primary, size: 24.0),
                    const SizedBox(height: 15),
                    Text(
                      'Copy',
                      style: TextStyle(color: AppColors.primary, fontSize: 16),
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
              )),
              Expanded(child: InkWell(
                onTap: () {
                  TextToSpeech tts = TextToSpeech();
                  tts.setLanguage('en-US');
                  tts.speak(result.word!);
                },
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Icon(Icons.volume_up_rounded,
                        color: AppColors.primary, size: 24.0),
                    const SizedBox(height: 15),
                    Text(
                      'Hear',
                      style: TextStyle(color: AppColors.primary, fontSize: 16),
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
              )),
              Expanded(child: InkWell(
                onTap: () {
                  context.read<DictionaryBloc>().add(OnClickSave(result, screen));
                  print("On Click Save");
                },
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Icon(Icons.bookmark_added_rounded,
                        color: AppColors.primary, size: 24.0),
                    const SizedBox(height: 15),
                    Text(
                      result.isSaved == 0 ? 'Save' : 'Delete',
                      style: TextStyle(color: AppColors.primary, fontSize: 16),
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
              )),
              Expanded(child: InkWell(
                onTap: () {
                  share(result.word!);
                },
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Icon(Icons.share_rounded,
                        color: AppColors.primary, size: 24.0),
                    const SizedBox(height: 15),
                    Text(
                      'Share',
                      style: TextStyle(color: AppColors.primary, fontSize: 16),
                    ),
                    const SizedBox(height: 5)
                  ],
                ),
              )),
            ],
          ),
          const SizedBox(height: 30),
          Text(result.mean!,
              style: TextStyle(color: AppColors.primary),
              textAlign: TextAlign.center),
          const SizedBox(height: 30)
        ],
      ));
}

Future<void> share(String word) async {
  await FlutterShare.share(
      title: 'Share Word',
      text: word,
      chooserTitle: 'Choose App'
  );
}


