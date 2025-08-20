import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_events.dart';
part 'todo_states.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates>{
  TodoBloc() : super(TaskTodoState()){
    on<ResetTodoEvent>(_initialResetHandler);
  }

  void _initialResetHandler(ResetTodoEvent event, Emitter<TodoStates> emit){
        emit(TaskTodoState(records: const []));
  }

}