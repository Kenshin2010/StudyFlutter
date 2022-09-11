import 'package:app/service/remote_data_source.dart';
import 'package:app/service/dictionary_repository_imp.dart';
import 'package:app/service/dictionary_repository.dart';
import 'package:app/data_manager/dictionary_manager.dart';
import 'package:app/bloc/dictionary_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:app/db_helper/database_helper.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => DictionaryBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => DictionaryManager(locator()));

  // repository
  locator.registerLazySingleton<DictionaryRepository>(
    () => DictionaryRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImp(
      databaseHelper: locator(),
    ),
  );

  // database
  locator.registerLazySingleton(() => DatabaseHelper());
}
