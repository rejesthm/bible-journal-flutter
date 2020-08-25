import 'dart:async';

import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/data/sources/mockdata.dart';
import 'package:bible_journal/domain/usecases/fetch_journals_use_case.dart';
import 'package:bible_journal/domain/usecases/listen_for_journals_use_case.dart';
import 'package:bible_journal/domain/usecases/store_journals_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

class HomePresenter extends BibleJournalPresenter {
  HomePresenter(
      BibleJournalPageState<BibleJournalPresenter> bibleJournalPageState)
      : super(bibleJournalPageState);

  Logger logger = new Logger();
  ListenForJournalsUseCase listenForJournalsUseCase;
  StoreJournalsUseCase storeJournalsUseCase;
  FetchJournalsUseCase fetchJournalsUseCase;
  List<Journals> journals;

  // ignore: close_sinks
  final busy = StreamController<bool>.broadcast();

  @override
  Future<void> onViewInit() async {
    listenForJournalsUseCase = GetIt.I.get<ListenForJournalsUseCase>();
    storeJournalsUseCase = GetIt.I.get<StoreJournalsUseCase>();
    fetchJournalsUseCase = GetIt.I.get<FetchJournalsUseCase>();
    journals = List<Journals>();

    storeJournals();
    await getJournals();
  }

  @override
  List<StreamController> get streamControllers => [];

  void storeJournals() async {
    final data = MockData.getJournals();
    await storeJournalsUseCase.execute(data);
  }

  Future<List<Journals>> getJournals() async {
    busy.sink.add(true);
    List<Journals> response = await fetchJournalsUseCase.execute();
    busy.sink.add(false);
    return response;
  }
}
