import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskCreatePage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  String name = '';
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // Salvar a tarefa
  void SaveTask(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      firestore.collection('tasks').add({
        'name': name,
        'finished': false,
        'uid': auth.currentUser!.uid,
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 250,
                maxLines: 3,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: 'O que você precisa fazer?',
                ),
                onSaved: (value) => name = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, informe a tarefa';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                  hintText: "Selecione a prioridade",
                ),
                // ignore: prefer_const_literals_to_create_immutables
                items: [
                  const DropdownMenuItem(
                    value: 1,
                    child: Text('Baixa'),
                  ),
                  const DropdownMenuItem(
                    child: Text('Média'),
                    value: 2,
                  ),
                  const DropdownMenuItem(
                    value: 3,
                    child: Text('Alta'),
                  ),
                ],
                onChanged: (value) {},
                onSaved: (newValue) {},
                validator: (value) {
                  if (value == null) {
                    return 'Por favor, selecione uma categoria';
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: 60,
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => SaveTask(context),
                child: const Text('Salvar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}