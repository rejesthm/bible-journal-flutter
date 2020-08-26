part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadJournals extends HomeEvent {}

class OnJournalLoaded extends HomeEvent {
  final List<Journals> journals;

  OnJournalLoaded(this.journals);

  @override
  List<Object> get props => [journals];
}
