import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/repository_impl/repository_impl.dart';
import 'package:bible_journal/domain/repository/repository.dart';
import 'package:bible_journal/domain/usecases/fetch_journals_use_case.dart';
import 'package:bible_journal/domain/usecases/listen_for_journals_use_case.dart';
import 'package:bible_journal/domain/usecases/store_journals_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'core/utils/app/env_util.dart';
import 'presentation/bloc/bloc/home_bloc.dart';

final sl = GetIt.instance;

class DataInstantiator extends BibleJournalDataInstantiator {
  Database database;

  @override
  Future<void> init() async {
    Map<String, String> env = await loadEnvFile();

    database = await getDatabase(env);

    Repository repository = RepositoryImpl(database);

    //bloc
    sl.registerFactory<HomeBloc>(
      () => HomeBloc(
        storeJournalsUseCase: StoreJournalsUseCase(repository),
        fetchJournalsUseCase: FetchJournalsUseCase(repository),
      ),
    );

    //core
    GetIt.I.registerSingleton<Database>(database);
    GetIt.I.registerSingleton<Repository>(repository);

    //usecases
    GetIt.I.registerLazySingleton<StoreJournalsUseCase>(
        () => StoreJournalsUseCase(repository));
    GetIt.I.registerLazySingleton<ListenForJournalsUseCase>(
        () => ListenForJournalsUseCase(repository));
    GetIt.I.registerLazySingleton<FetchJournalsUseCase>(
        () => FetchJournalsUseCase(repository));
  }

  Future<Database> getDatabase(Map<String, String> env) async {
    var dir = await getApplicationDocumentsDirectory();
    await dir.create(recursive: true);
    var dbPath = join(dir.path, env['LOCAL_DB']);

    return await databaseFactoryIo.openDatabase(dbPath);
  }
}
