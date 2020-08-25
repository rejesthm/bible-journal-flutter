part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class JournalsLoading extends HomeState {}

class JournalStored extends HomeState {}

class JournalsLoaded extends HomeState {
  final List<Journals> journals;

  JournalsLoaded(this.journals);

  @override
  List<Object> get props => [journals];
}
