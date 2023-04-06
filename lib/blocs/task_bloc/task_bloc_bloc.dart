import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:todolist_bloc/models/task.dart';

part 'task_bloc_event.dart';
part 'task_bloc_state.dart';

/// Terakhir disini kita  akan mengkontrol events dan melakukan emit pada state

class TaskBlocBloc extends HydratedBloc<TaskBlocEvent, TaskBlocState> {
  TaskBlocBloc() : super(const TaskBlocState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTask = List.from(state.allTask)..add(task!);
    emit(TaskBlocState(allTask: allTask, removedTask: state.removedTask));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    final task = event.task;

    final int index = state.allTask.indexOf(task!);

    List<Task> allTask = List.from(state.allTask)..remove(task);

    task.isDone == false
        ? allTask.insert(index, task.copyWith(isDone: true))
        : allTask.insert(index, task.copyWith(isDone: false));

    emit(TaskBlocState(allTask: allTask, removedTask: state.removedTask));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> deleteTask = List.from(state.removedTask)..remove(task);

    emit(TaskBlocState(allTask: state.allTask, removedTask: deleteTask));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> allTask = List.from(state.allTask)..remove(task);
    List<Task> removedTask = List.from(state.removedTask)
      ..add(event.task!.copyWith(isDeleted: true));

    emit(TaskBlocState(allTask: allTask, removedTask: removedTask));
  }

  @override
  TaskBlocState? fromJson(Map<String, dynamic> json) {
    return TaskBlocState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskBlocState state) {
    return state.toMap();
  }
}
