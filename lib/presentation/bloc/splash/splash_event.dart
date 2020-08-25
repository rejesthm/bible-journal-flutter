part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class AppOnload extends SplashEvent {
  const AppOnload();

  @override
  List<Object> get props => [];
}
