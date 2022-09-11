
import 'package:app/bloc/dictionary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app/model/word.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/bloc/dictionary_event.dart';

class ItemWord extends StatefulWidget{

  Word result;

  ItemWord(this.result, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ItemWordState(result);
  }

}

class ItemWordState extends State{

  Word result;

  ItemWordState(this.result);

  @override
  Widget build(BuildContext context) {
    return buildCardWord(result, context);
  }

  Card buildCardWord(Word result, BuildContext context) {
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
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Icon(Icons.copy, color: AppColors.primary, size: 24.0),
                      SizedBox(height: 15),
                      Text(
                        'Copy',
                        style: TextStyle(color: AppColors.primary, fontSize: 16),
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
                )),
                Expanded(child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Icon(Icons.volume_up_rounded,
                          color: AppColors.primary, size: 24.0),
                      SizedBox(height: 15),
                      Text(
                        'Hear',
                        style: TextStyle(color: AppColors.primary, fontSize: 16),
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
                )),
                Expanded(child: InkWell(
                  onTap: () {
                    context.read<DictionaryBloc>().add(OnClickSave(result));
                    print("On Click Save");
                  },
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Icon(Icons.bookmark_added_rounded,
                          color: AppColors.primary, size: 24.0),
                      SizedBox(height: 15),
                      Text(
                        'Save',
                        style: TextStyle(color: AppColors.primary, fontSize: 16),
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
                )),
                Expanded(child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      Icon(Icons.share_rounded,
                          color: AppColors.primary, size: 24.0),
                      SizedBox(height: 15),
                      Text(
                        'Share',
                        style: TextStyle(color: AppColors.primary, fontSize: 16),
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
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

}


