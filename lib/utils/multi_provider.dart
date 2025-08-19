import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hireme_v2/bloc/home/home_bloc.dart';

class BlocProviders extends StatelessWidget {
  final Widget child;
  const BlocProviders({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc(),)
        ],
        child: child
    );
  }
}
