import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_v2/bloc/todo/todo_bloc.dart';

class BlocProviders extends StatelessWidget {
  Widget child;
  BlocProviders({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TodoBloc()..add(ResetTodoEvent()),)
        ],
        child: child
    );
  }
}
