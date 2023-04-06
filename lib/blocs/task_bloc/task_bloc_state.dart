// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'task_bloc_bloc.dart';

/// Kita buat sebuah bloc State untuk Tasknya
class TaskBlocState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoriteTasks;
  final List<Task> removedTask;
  const TaskBlocState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.favoriteTasks = const <Task>[],
    this.removedTask = const <Task>[],
  });

  @override
  List<Object> get props =>
      [pendingTasks, completedTasks, favoriteTasks, removedTask];
  @override
  bool get stringify => true;

  Map<String, dynamic> toMap() {
    return {
      'allTask': pendingTasks.map((x) => x.toMap()).toList(),
      'completedTasks': completedTasks.map((x) => x.toMap()).toList(),
      'favoriteTasks': favoriteTasks.map((x) => x.toMap()).toList(),
      'removedTask': removedTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskBlocState.fromMap(Map<String, dynamic> map) {
    return TaskBlocState(
      pendingTasks: List<Task>.from(
        (map['pendingTasks']?.map(
          (x) => Task.fromMap(x),
        )),
      ),
      completedTasks: List<Task>.from(
        (map['completedTasks']?.map(
          (x) => Task.fromMap(x),
        )),
      ),
      favoriteTasks: List<Task>.from(
        (map['favoriteTasks']?.map(
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
