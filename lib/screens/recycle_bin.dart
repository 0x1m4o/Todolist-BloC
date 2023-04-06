import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import 'package:todolist_bloc/blocs/bloc_exports.dart';
import 'package:todolist_bloc/models/task.dart';
import 'package:todolist_bloc/widgets/task_list.dart';

import './drawer.dart';

class RecycleBinScreen extends StatelessWidget {
  static const nameRoute = 'recycle_bin_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBlocBloc, TaskBlocState>(
      builder: (context, state) {
        List<Task> taskList = state.removedTask;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 87, 108, 188),
            title: Text('My Trash'),
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text('${taskList.length} Tasks')),
              ),
              TaskList(taskList: taskList),
            ],
          ),
        );
      },
    );
  }
}
