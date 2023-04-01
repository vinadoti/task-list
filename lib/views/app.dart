import 'package:flutter/material.dart';
import 'package:task_list/views/task-list.dart';
import 'package:task_list/views/task-create.dart';
import 'package:task_list/views/user-login.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: {
        '/task-list': (context) => TaskListPage(),
        '/task-create': (context) => TaskCreatePage(),
        '/login': (context) => UserLoginPage(),
      },
      initialRoute: '/task-list',
    );
  }
}