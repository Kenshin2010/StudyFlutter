import 'package:app/model/dictionary.dart';
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
  final Dictionary dictionary;
  const OnWordDetail(this.dictionary);
}
