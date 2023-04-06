import 'package:flutter/material.dart';
import 'package:todolist_bloc/screens/recycle_bin.dart';
import 'package:todolist_bloc/screens/pending_screen.dart';
import 'package:todolist_bloc/screens/tabs_screen.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TabsScreen.nameRoute:
        return MaterialPageRoute(
          builder: (context) => TabsScreen(),
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
