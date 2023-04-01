import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
        .pushNamed('/task-create'),
        child: const Icon(Icons.add),
        ),
      );
  }
}
