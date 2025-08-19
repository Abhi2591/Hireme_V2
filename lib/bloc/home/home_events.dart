part of 'home_bloc.dart';

sealed class HomeEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchHomeEvent extends HomeEvents {
  @override
  List<Object?> get props => [];
}

class RemoveRecordHomeEvent extends HomeEvents {
  String? id;

  RemoveRecordHomeEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class UpdateRecordHomeEvents extends HomeEvents {
  String? id;
  Map<String, String> newData;

  UpdateRecordHomeEvents({required this.id, required this.newData});

  @override
  List<Object?> get props => [id, newData];
}
