import 'dart:async';

import 'package:bible_journal/data/sources/mockdata.dart';
import 'package:bible_journal/domain/usecases/store_journals_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final StoreJournalsUseCase storeJournalsUseCase;
  SplashBloc({this.storeJournalsUseCase}) : super(SplashInitial());

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    yield SplashInitial();
    if (event is AppOnload) {
      final data = MockData.getJournals();
      await storeJournalsUseCase.execute(data);
      yield JournalsOnLoad();
    }
  }
}
