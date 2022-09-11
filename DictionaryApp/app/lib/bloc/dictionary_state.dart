import 'package:app/model/word.dart';
import 'package:equatable/equatable.dart';

abstract class DictionaryState extends Equatable {
  const DictionaryState();

  @override
  List<Object?> get props => [];
}

class DictionaryEmpty extends DictionaryState {}

class DictionaryLoading extends DictionaryState {}

class DictionaryError extends DictionaryState {
  final String message;
  const DictionaryError(this.message);
  @override
  List<Object?> get props => [message];
}

class DictionaryComplete extends DictionaryState {
  final List<Word> result;
  const DictionaryComplete(this.result);
  @override
  List<Object?> get props => [result];
}

class DictionaryDetails extends DictionaryState{
  final Word result;
  const DictionaryDetails(this.result);
}

class SavedWord extends DictionaryState{
  final Word word;
  const SavedWord(this.word);
}

class DictionaryAllData extends DictionaryState{
  final List<Word> words;
  const DictionaryAllData(this.words);
}
