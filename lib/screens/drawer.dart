import 'package:flutter/material.dart';
import 'package:todolist_bloc/blocs/bloc/task_bloc_bloc.dart';
import 'package:todolist_bloc/blocs/bloc_exports.dart';
import 'package:todolist_bloc/screens/recycle_bin.dart';
import 'package:todolist_bloc/screens/tasks_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 15),
              width: double.infinity,
              color: Color.fromARGB(255, 25, 55, 109),
              child: Text('Rizzler Task',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white)),
            ),
            BlocBuilder<TaskBlocBloc, TaskBlocState>(
              builder: (context, state) {
                return ListTile(
                  shape: Border(
                    bottom: BorderSide(width: 0.2),
                  ),
                  onTap: () =>
                      Navigator.of(context).pushNamed(TaskScreen.nameRoute),
                  leading: Icon(Icons.folder),
                  title: Text('My Tasks'),
                  trailing: Text('${state.allTask.length}'),
                );
              },
            ),
            BlocBuilder<TaskBlocBloc, TaskBlocState>(
              builder: (context, state) {
                return ListTile(
                  shape: Border(
                    bottom: BorderSide(width: 0.2),
                  ),
                  onTap: () => Navigator.of(context)
                      .pushNamed(RecycleBinScreen.nameRoute),
                  leading: Icon(Icons.delete),
                  title: Text('Trash'),
                  trailing: Text('${state.removedTask.length}'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
