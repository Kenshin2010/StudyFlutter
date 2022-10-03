import 'package:app/model/word.dart';
import 'package:equatable/equatable.dart';

abstract class DictionaryEvent extends Equatable {
  const DictionaryEvent();
  @override
  List<Object?> get props => [];
}

class OnWordChange extends DictionaryEvent {
  final String word;
  const OnWordChange(this.word);
  @override
  List<Object?> get props => [word];
}

class OnWordDetail extends DictionaryEvent {
  final Word dictionary;
  const OnWordDetail(this.dictionary);
  @override
  List<Object?> get props => [dictionary];
}

class OnClickSave extends DictionaryEvent{
  final Word word;
  final int screen;
  const OnClickSave(this.word, this.screen);
  @override
  List<Object?> get props => [word];
}

class onGetListSaved extends DictionaryEvent{
  const onGetListSaved();
}
