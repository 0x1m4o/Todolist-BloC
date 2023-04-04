import 'package:flutter/material.dart';
import 'package:todolist_bloc/blocs/bloc/task_bloc_bloc.dart';
import 'package:todolist_bloc/models/task.dart';
import 'package:todolist_bloc/shared/show_snackbar.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.myTask,
    required this.task,
  });

  final TaskBlocBloc myTask;
  final Task task;

  void _onDeleteOrRemove(BuildContext context, Task task) {
    task.isDeleted!
        ? myTask.add(DeleteTask(task: task))
        : myTask.add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        myTask.add(UpdateTask(task: task));
      },
      leading: Checkbox(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        value: task.isDone,
        onChanged: task.isDeleted == false
            ? (value) => myTask.add(UpdateTask(task: task))
            : null,
      ),
      title: Text(task.title,
          style: TextStyle(
              decoration: task.isDone! ? TextDecoration.lineThrough : null,
              fontSize: 18)),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Delete Task'),
                content: Container(
                    child: Text(
                  'Are you sure to delete this task',
                  textAlign: TextAlign.start,
                )),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('No')),
                      TextButton(
                          onPressed: () {
                            _onDeleteOrRemove(context, task);
                            Navigator.of(context).pop();
                            showSnackBar(context, 'Task has been deleted');
                          },
                          child: Text('Yes'))
                    ],
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
