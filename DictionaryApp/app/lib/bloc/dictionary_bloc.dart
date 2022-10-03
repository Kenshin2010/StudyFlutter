import 'package:flutter_bloc/flutter_bloc.dart';
import 'dictionary_event.dart';
import 'dictionary_state.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/data_manager/dictionary_manager.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final DictionaryManager _manager;

  DictionaryBloc(this._manager) : super(DictionaryEmpty()) {
    /**
     * onWordChange in here
     */
    on<OnWordChange>(
      (event, word) async {
        final word = event.word;
        emit(DictionaryLoading());
        final result = await _manager.execute(word);
        result.fold((failure) {
          emit(DictionaryError(failure.message));
        }, (data) {
          if (data.isEmpty) {
            emit(DictionaryEmpty());
          } else {
            emit(DictionaryComplete(data));
          }
        });
      },
      transformer: delay(const Duration(milliseconds: 200)),
    );

    /**
     * onWordDetail in here
     */
    on<OnWordDetail>((event, item) async {
      var data = event.dictionary;
      emit(DictionaryDetails(data));
    });

    /**
     * onSaveWord in here
     */
    on<OnClickSave>((event, item) async {
      var data = event.word;
      final result = await _manager.save(data);
      result.fold((failure) {
        emit(DictionaryError(failure.message));
      }, (item) {
          emit(DictionarySave(item, event.screen));
      });
    });

    /**
     * onGetListWordSaved in here
     */
    on<onGetListSaved>((event, item) async {
      final result = await _manager.getAll();
      result.fold((failure) {
        emit(DictionaryError(failure.message));
      }, (data) {
        if (data.isEmpty) {
          emit(DictionaryEmpty());
        } else {
          emit(DictionaryAllData(data));
        }
      });
    });
  }

  EventTransformer<T> delay<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
