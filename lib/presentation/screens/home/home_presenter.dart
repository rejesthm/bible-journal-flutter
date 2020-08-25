import 'dart:async';

import 'package:bible_journal/core/architecture.dart/architecture.dart';
import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/data/sources/mockdata.dart';
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

  StreamController<List<Journals>> journalsController =
      StreamController<List<Journals>>.broadcast();

  @override
  Future<void> onViewInit() async {
    listenForJournalsUseCase = GetIt.I.get<ListenForJournalsUseCase>();
    storeJournalsUseCase = GetIt.I.get<StoreJournalsUseCase>();

    storeJournals();
    journalsController.addStream(listenForJournalsUseCase.stream());

    // List<Journals> journals;
    // listenForJournalsUseCase.stream().listen((event) {
    //   journals = event;
    // });

    // await Future.delayed(Duration(milliseconds: 350));

    // print(journals[0].authorProfile.authorName);
  }

  @override
  List<StreamController> get streamControllers => [journalsController];

  void storeJournals() async {
    final data = MockData.getJournals();
    storeJournalsUseCase.execute(data);
  }
}
