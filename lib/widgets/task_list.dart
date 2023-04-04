import 'package:flutter/material.dart';
import 'package:todolist_bloc/widgets/task_tile.dart';
import '../blocs/bloc_exports.dart';
import 'package:todolist_bloc/models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    final myTask = context.read<TaskBlocBloc>();
    return Expanded(
        child: ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) {
        var task = taskList[index];
        return GestureDetector(
          child: TaskTile(myTask: myTask, task: task),
        );
      },
    ));
  }
}
