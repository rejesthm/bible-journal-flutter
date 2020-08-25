part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadJournals extends HomeEvent {
  final List<Journals> journals;

  LoadJournals(this.journals);

  @override
  List<Object> get props => [journals];
}

class OnJournalLoad extends HomeEvent {}
