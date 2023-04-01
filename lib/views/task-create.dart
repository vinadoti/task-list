import 'package:flutter/material.dart';

class TaskCreatePage extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  void saveTask(BuildContext context) {

    if (formKey.currentState!.validate()) {
      
      formKey.currentState!.save();

      // TODO: Salvar tarefa no banco de dados
      // firestore.add({'name': 'tarefa'});

      Navigator.of(context).pop();
      print('Salvando tarefa');
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Tarefa'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            // campo para selecionar data com o datepicker
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Data',
                ),
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2022),
                  );
                  print(date);
                },
                onSaved: (newValue) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma data';
                  }
                  return null;
                },
              ),
            ),
            
            //campo select para escolher a categoria
            Container(
              padding: EdgeInsets.all(20),
              child: DropdownButtonFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  labelText: 'Prioridade',
                ),
                items: [
                  DropdownMenuItem(
                    child: Text('Alta'),
                    value: 'alta',
                  ),
                  DropdownMenuItem(
                    child: Text('Média'),
                    value: 'media',
                  ),
                  DropdownMenuItem(
                    child: Text('Baixa'),
                    value: 'baixa',
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
              padding: EdgeInsets.all(20),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                minLines: 1,
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(
                  labelText: 'Nova tarefa',
                ),
                onSaved: (newValue) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma tarefa';
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 200,
              child: ElevatedButton(
                onPressed: () => saveTask(context),
                child: const Text('Salvar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
