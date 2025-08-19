import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_events.dart';
part 'home_states.dart';


class HomeBloc extends Bloc<HomeEvents,HomeStates>{
  HomeBloc(): super(InitialHomeState()){

  }
}
