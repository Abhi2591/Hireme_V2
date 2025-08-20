part of 'todo_bloc.dart';

sealed class TodoEvents extends Equatable{
  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodoEvents{}

class UpdateTodoEvent extends TodoEvents{}

class RemoveTodoEvent extends TodoEvents{}

class ResetTodoEvent extends TodoEvents{}