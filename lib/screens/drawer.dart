import 'package:flutter/material.dart';
import 'package:todolist_bloc/screens/tabs_screen.dart';
import '../blocs/bloc_exports.dart';
import 'package:todolist_bloc/screens/recycle_bin.dart';
import 'package:todolist_bloc/screens/pending_screen.dart';

class MyDrawer extends StatelessWidget {
  final bool switchValue = false;

  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final switchEvent = context.read<SwitchBlocBloc>();
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 15),
              width: double.infinity,
              color: Color.fromARGB(255, 25, 55, 109),
              child: Row(
                children: [
                  Text('Rizzler Task',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white)),
                  SizedBox(
                    width: 10,
                  ),
                  BlocBuilder<SwitchBlocBloc, SwitchBlocState>(
                    builder: (context, state) {
                      return Switch(
                        value: state.switchValue,
                        onChanged: (value) => value
                            ? switchEvent.add(SwitchOn())
                            : switchEvent.add(SwitchOff()),
                      );
                    },
                  )
                ],
              ),
            ),
            BlocBuilder<TaskBlocBloc, TaskBlocState>(
              builder: (context, state) {
                return ListTile(
                  shape: Border(
                    bottom: BorderSide(width: 0.2),
                  ),
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.nameRoute),
                  leading: Icon(Icons.folder),
                  title: Text('My Tasks'),
                  trailing: Text('${state.pendingTasks.length}'),
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
                      .pushReplacementNamed(RecycleBinScreen.nameRoute),
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
