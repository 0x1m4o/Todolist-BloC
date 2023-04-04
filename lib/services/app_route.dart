import 'package:flutter/material.dart';
import 'package:todolist_bloc/screens/recycle_bin.dart';
import 'package:todolist_bloc/screens/tasks_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TaskScreen.nameRoute:
        return MaterialPageRoute(
          builder: (context) => TaskScreen(),
        );
      case RecycleBinScreen.nameRoute:
        return MaterialPageRoute(
          builder: (context) => RecycleBinScreen(),
        );
      default:
        return null;
    }
  }
}
