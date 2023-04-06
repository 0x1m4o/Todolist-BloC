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

    List<Task> pendingTasks = List.from(state.pendingTasks)..add(task!);
    emit(TaskBlocState(
        pendingTasks: pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
        removedTask: state.removedTask));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;

    task?.isDone == false
        ? {
            /// Remove the pending task and add to completed task
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task!.copyWith(isDone: true))
          }
        : {
            /// Remove the completed tasks and add to pending task
            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task!.copyWith(isDone: false))
          };

    emit(TaskBlocState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: favoriteTasks,
        removedTask: state.removedTask));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> deleteTask = List.from(state.removedTask)..remove(task);

    emit(TaskBlocState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.completedTasks,
        removedTask: deleteTask));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskBlocState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = List.from(state.pendingTasks)..remove(task);
    List<Task> completedTasks = List.from(state.completedTasks)..remove(task);
    List<Task> favoriteTasks = List.from(state.favoriteTasks)..remove(task);
    List<Task> removedTask = List.from(state.removedTask)
      ..add(event.task!.copyWith(isDeleted: true));

    emit(TaskBlocState(
        pendingTasks: pendingTasks,
        completedTasks: completedTasks,
        favoriteTasks: favoriteTasks,
        removedTask: removedTask));
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
