// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'switch_bloc_bloc.dart';

class SwitchBlocState extends Equatable {
  final bool switchValue;
  const SwitchBlocState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'switchValue': switchValue,
    };
  }

  factory SwitchBlocState.fromMap(Map<String, dynamic> map) {
    return SwitchBlocState(
      switchValue: map['switchValue'] as bool,
    );
  }
}

class SwitchBlocInitial extends SwitchBlocState {
  const SwitchBlocInitial({required super.switchValue});
}
