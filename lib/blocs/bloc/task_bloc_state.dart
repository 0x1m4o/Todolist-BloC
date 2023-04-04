// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc_bloc.dart';

/// Kita buat sebuah bloc State untuk Tasknya
class TaskBlocState extends Equatable {
  final List<Task> allTask;
  final List<Task> removedTask;
  const TaskBlocState({
    this.allTask = const <Task>[],
    this.removedTask = const <Task>[],
  });

  @override
  List<Object> get props => [allTask, removedTask];
  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'allTask': allTask.map((x) => x.toMap()).toList(),
      'removedTask': removedTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskBlocState.fromMap(Map<String, dynamic> map) {
    return TaskBlocState(
      allTask: List<Task>.from(
        (map['allTask']?.map(
          (x) => Task.fromMap(x),
        )),
      ),
      removedTask: List<Task>.from(
        (map['removedTask']?.map(
          (x) => Task.fromMap(x),
        )),
      ),
    );
  }
}
