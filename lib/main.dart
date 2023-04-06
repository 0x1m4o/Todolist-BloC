import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist_bloc/services/app_theme.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBlocBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBlocBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBlocBloc, SwitchBlocState>(
        builder: (context, state) {
          return MaterialApp(
            home: TaskScreen(),
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            onGenerateRoute: appRoute.onGenerateRoute,
          );
        },
      ),
    );
  }
}
