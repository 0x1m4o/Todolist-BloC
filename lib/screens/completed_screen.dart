import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import 'package:todolist_bloc/models/task.dart';
import 'package:todolist_bloc/widgets/task_list.dart';

class CompletedScreen extends StatelessWidget {
  static const nameRoute = 'task_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBlocBloc, TaskBlocState>(
      builder: (context, state) {
        List<Task> taskList = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('${taskList.length} Tasks')),
            ),
            TaskList(taskList: taskList),
          ],
        );
      },
    );
  }
}
