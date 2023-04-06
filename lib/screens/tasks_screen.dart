import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc_exports.dart';
import 'package:todolist_bloc/models/task.dart';
import 'package:todolist_bloc/widgets/task_list.dart';
import './add_dialog_screen.dart';
import './drawer.dart';

class TaskScreen extends StatelessWidget {
  static const nameRoute = 'task_screen';
  final _formKey = GlobalKey<FormState>();
  void _addTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.white,
            insetPadding: EdgeInsets.all(20),
            child: AddTaskDialog(formKey: _formKey));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBlocBloc, TaskBlocState>(
      builder: (context, state) {
        List<Task> taskList = state.allTask;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 87, 108, 188),
            title: Text('Task Screen'),
            actions: [
              IconButton(
                  onPressed: () => _addTask(context), icon: Icon(Icons.add))
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Color.fromARGB(255, 43, 96, 196),
              onPressed: () => _addTask(context),
              label: Row(
                children: [
                  Icon(Icons.add_task_rounded),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Add Tasks',
                  )
                ],
              )),
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
