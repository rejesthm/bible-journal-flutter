import 'dart:async';

import 'package:bible_journal/data/models/journals.dart';
import 'package:bible_journal/domain/usecases/fetch_journals_use_case.dart';
import 'package:bible_journal/domain/usecases/store_journals_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final StoreJournalsUseCase storeJournalsUseCase;
  final FetchJournalsUseCase fetchJournalsUseCase;
  HomeBloc({
    this.storeJournalsUseCase,
    this.fetchJournalsUseCase,
  }) : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is OnJournalLoad) {
      yield JournalsLoading();
      List<Journals> journalData = await fetchJournalsUseCase.execute();
      add(LoadJournals(journalData));
    } else if (event is LoadJournals) {
      yield JournalsLoaded(event.journals);
    }
  }
}
