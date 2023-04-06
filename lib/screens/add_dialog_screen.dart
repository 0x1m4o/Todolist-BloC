import 'package:flutter/material.dart';
import '../blocs/bloc_exports.dart';
import 'package:todolist_bloc/models/task.dart';
import '../shared/text_fields_decoration.dart';
import '../shared/add_task_validated.dart';
import '../services/guid_gen.dart';

class AddTaskDialog extends StatelessWidget {
  const AddTaskDialog({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    TextEditingController inputTitle = TextEditingController();
    final myTask = context.read<TaskBlocBloc>();
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  autofocus: true,
                  controller: inputTitle,
                  validator: validateTask,
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Your Task Title',
                      labelText: 'Title',
                      floatingLabelStyle: const TextStyle(
                          color: Color.fromARGB(255, 87, 108, 188))),
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 90,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 234, 84, 85),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 90,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        var task = Task(
                            title: inputTitle.text, id: GUIDGen.generate());
                        if (_formKey.currentState!.validate()) {
                          myTask.add(AddTask(task: task));
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('Add '),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 87, 108, 188),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
