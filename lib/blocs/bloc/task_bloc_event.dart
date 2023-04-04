part of 'task_bloc_bloc.dart';

/// Setelah membuat bloc state kita akan membuat bloc event dari setiap kondisi
abstract class TaskBlocEvent extends Equatable {
  const TaskBlocEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TaskBlocEvent {
  final Task? task;

  const AddTask({this.task});

  @override
  List<Object> get props => [task!];
}

class UpdateTask extends TaskBlocEvent {
  final Task? task;

  const UpdateTask({this.task});

  @override
  List<Object> get props => [task!];
}

class DeleteTask extends TaskBlocEvent {
  final Task? task;

  const DeleteTask({this.task});

  @override
  List<Object> get props => [task!];
}

class RemoveTask extends TaskBlocEvent {
  final Task? task;

  const RemoveTask({this.task});

  @override
  List<Object> get props => [task!];
}
