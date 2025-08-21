part of 'todo_bloc.dart';

sealed class TodoStates extends Equatable{
  @override
  List<Object?> get props => [];
}

class TaskTodoState extends TodoStates{
  List<Map<String, dynamic>> records;
  TaskTodoState({this.records = const []});

  TaskTodoState copyWith({
    List<Map<String, dynamic>>? records
}){
    return TaskTodoState(
      records: records ?? this.records
    );
  }

  @override
  List<Object?> get props => [records];
}

