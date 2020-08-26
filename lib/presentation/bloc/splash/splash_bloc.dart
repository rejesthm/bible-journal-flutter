import 'dart:async';

import 'package:bible_journal/data/sources/mockdata.dart';
import 'package:bible_journal/domain/usecases/fetch_journals_use_case.dart';
import 'package:bible_journal/domain/usecases/store_journals_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final StoreJournalsUseCase storeJournalsUseCase;
  final FetchJournalsUseCase fetchJournalsUseCase;
  SplashBloc({
    this.storeJournalsUseCase,
    this.fetchJournalsUseCase,
  }) : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    yield SplashInitial();
    if (event is AppOnload) {
      if ((await fetchJournalsUseCase.execute()).length != 0) {
        yield JournalsLoadingSuccess();
      } else {
        final data = MockData.getJournals();
        await storeJournalsUseCase.execute(data);
        yield JournalsLoadingSuccess();
      }
    }
  }
}
