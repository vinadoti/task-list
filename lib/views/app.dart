import 'package:flutter/material.dart';
import 'package:task_list/views/task-list.dart';
import 'package:task_list/views/task-create.dart';
import 'package:task_list/views/user-login.dart';
import 'package:task_list/views/user-register.dart';

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
        '/register': (context) => UserRegisterPage(),
      },
      initialRoute: '/login',
    );
  }
}


void main() {
  runApp(App());
}
