import 'package:flutter_bloc/flutter_bloc.dart';
import 'dictionary_event.dart';
import 'dictionary_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/action/get_list_word.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final GetListWord _getListWord;

  DictionaryBloc(this._getListWord) : super(DictionaryEmpty()) {
    on<OnWordChange>(
          (event, word) async {
        final word = event.word;
        emit(DictionaryLoading());
        final result = await _getListWord.execute(word);
        result.fold((failure) {
          emit(DictionaryError(failure.message));
        },(data) {
          emit(DictionaryHasData(data));
        },
        );
      },
      transformer: delay(const Duration(milliseconds: 500)),
    );
  }

  EventTransformer<T> delay<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
