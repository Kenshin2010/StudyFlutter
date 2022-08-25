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

class DictionaryHasData extends DictionaryState {
  final List<Dictionary> result;

  DictionaryHasData(this.result);

  @override
  List<Object?> get props => [result];
}
