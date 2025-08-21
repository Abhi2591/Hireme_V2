import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_v2/utils/custom_stuffs.dart';

part 'todo_events.dart';
part 'todo_states.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates>{
  TodoBloc() : super(TaskTodoState()){
    on<ResetTodoEvent>(_resetTaskHandler);
    on<AddTodoEvent>(_insertNewTaskHandler);
    on<RemoveTodoEvent>(_deleteTaskHandler);
  }

  void _deleteTaskHandler(RemoveTodoEvent event, Emitter<TodoStates> emit){
    final currentState = state;
    if(currentState is! TaskTodoState)return;

    final updatedTodo = List<Map<String,dynamic>>.from(currentState.records).where((element) => element['id'] != event.id,).toList();
    emit(currentState.copyWith(records: updatedTodo));
  }


  void _resetTaskHandler(ResetTodoEvent event, Emitter<TodoStates> emit){
    emit(TaskTodoState(records: []));
  }

  void _insertNewTaskHandler(AddTodoEvent event, Emitter<TodoStates> emit){
      final currentState = state;
      if(currentState is! TaskTodoState)return;

      if(event.title.isEmpty || event.desc.isEmpty){
        CustomSnackbar(event.ctx, "Sorry, you missed some fields");
        return;
      }

      final prepareData = {
        "id" : currentState.records.length + 1,
        "title" : event.title,
        "desc" : event.desc,
        "isCompleted" : false
      };

      final updatedList = List<Map<String,dynamic>>.from(currentState.records)..add(prepareData);

      emit(currentState.copyWith(records: updatedList));

  }

}