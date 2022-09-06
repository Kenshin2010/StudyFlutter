import 'package:app/model/dictionary.dart';
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

  DictionaryError(this.message);

  @override
  List<Object?> get props => [message];
}

class DictionaryComplete extends DictionaryState {
  final List<Dictionary> result;

  DictionaryComplete(this.result);

  @override
  List<Object?> get props => [result];
}

class DictionaryDetails extends DictionaryState{
  final List<String> result;

  DictionaryDetails(this.result);

  @override
  List<Object?> get props => [result];
}
