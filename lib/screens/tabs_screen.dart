import 'package:flutter/material.dart';
import 'package:todolist_bloc/screens/completed_screen.dart';
import 'package:todolist_bloc/screens/drawer.dart';
import 'package:todolist_bloc/screens/favorite_screen.dart';
import 'package:todolist_bloc/screens/pending_screen.dart';
import './add_dialog_screen.dart';

class TabsScreen extends StatefulWidget {
  static const nameRoute = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> _tabsDetails = [
    {'pageName': PendingScreen(), 'title': 'Pending Tasks'},
    {'pageName': CompletedScreen(), 'title': 'Completed Screen Tasks'},
    {'pageName': FavoriteScreen(), 'title': 'Favorite Screen Tasks'}
  ];

  var _selectedIndex = 0;

  @override
  void _addTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: Colors.black54,
            insetPadding: EdgeInsets.all(20),
            child: AddTaskDialog(formKey: _formKey));
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 87, 108, 188),
        title: Text(_tabsDetails[_selectedIndex]['title']),
        actions: [
          IconButton(onPressed: () => _addTask(context), icon: Icon(Icons.add))
        ],
      ),
      body: _tabsDetails[_selectedIndex]['pageName'],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton.extended(
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
              ))
          : null,
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Pending Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: 'Completed Tasks',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite Tasks',
            ),
          ]),
    );
  }
}
