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
}

class OnClickSave extends DictionaryEvent{
  final Word word;
  const OnClickSave(this.word);
}

class onGetListSaved extends DictionaryEvent{
  const onGetListSaved();
}
