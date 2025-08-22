part of 'todo_bloc.dart';

sealed class TodoEvents extends Equatable{
  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoEvents{
  String title;
  String desc;
  BuildContext ctx;
  AddTodoEvent({required this.title, required this.desc, required this.ctx});
}

class UpdateTodoEvent extends TodoEvents{
  final id;
  final newValue;
  UpdateTodoEvent({required this.id, required this.newValue});
  @override
  List<Object?> get props => [id, newValue];
}

class RemoveTodoEvent extends TodoEvents{
  final id;
  RemoveTodoEvent({required this.id});
  @override
  List<Object?> get props => [id];
}

class ResetTodoEvent extends TodoEvents{}