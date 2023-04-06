part of 'switch_bloc_bloc.dart';

abstract class SwitchBlocEvent extends Equatable {
  const SwitchBlocEvent();

  @override
  List<Object> get props => [];
}

class SwitchOff extends SwitchBlocEvent {}

class SwitchOn extends SwitchBlocEvent {}
