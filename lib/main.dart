import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import './blocs/bloc_exports.dart';
import 'package:todolist_bloc/screens/tasks_screen.dart';
import './services/app_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  runApp(MyTodoListApp(
    appRoute: AppRoute(),
  ));
}

class MyTodoListApp extends StatelessWidget {
  const MyTodoListApp({Key? key, required this.appRoute}) : super(key: key);
  final AppRoute appRoute;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBlocBloc(),
      child: MaterialApp(
        home: TaskScreen(),
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }
}
