part of 'todo_bloc.dart';

sealed class TodoStates extends Equatable{
  @override
  List<Object?> get props => [];
}

class TaskTodoState extends TodoStates{
  List records;
  TaskTodoState({this.records = const []});
  @override
  List<Object?> get props => [records];
}

