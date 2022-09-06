import 'package:flutter_bloc/flutter_bloc.dart';
import 'dictionary_event.dart';
import 'dictionary_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/action/get_data_word.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final GetDataWord _getListWord;

  DictionaryBloc(this._getListWord) : super(DictionaryEmpty()) {
    /**
     * onWordChange in here
     */
    on<OnWordChange>(
      (event, word) async {
        final word = event.word;
        emit(DictionaryLoading());
        final result = await _getListWord.execute(word);
        result.fold((failure) {
          emit(DictionaryError(failure.message));
        }, (data) {
          if(data.isEmpty){
            emit(DictionaryEmpty());
          }else{
            emit(DictionaryComplete(data));
          }
        });
      },
      transformer: delay(const Duration(milliseconds: 200)),
    );

    /**
     * onWordDetail in here
     */
    on<OnWordDetail>(
      (event, dictionary) async {
        var data = event.dictionary;
        emit(DictionaryDetails(data));
        }
    );
  }

  EventTransformer<T> delay<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
