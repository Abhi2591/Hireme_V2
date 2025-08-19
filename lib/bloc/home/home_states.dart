part of 'home_bloc.dart';

sealed class HomeStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialHomeState extends HomeStates {
  @override
  List<Object?> get props => [];
}

class LoadingHomeState extends HomeStates {
  @override
  List<Object?> get props => [];
}

class RecordsHomeState extends HomeStates {
  List data = [];

  RecordsHomeState({required this.data});

  @override
  List<Object?> get props => [data];
}

class FailedHomeState extends HomeStates {
  String? message;

  FailedHomeState({this.message});

  @override
  List<Object?> get props => [message];
}
