import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserLoginPage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  var formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      
      try{
        await auth.signInWithEmailAndPassword(email: email, password: password);
        
        Navigator.of(context).pushNamed('/task-list');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('A senha é muito fraca');
        } else if (e.code == 'email-already-in-use') {
          print('O email já está em uso');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Acessar conta',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 32),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    onSaved: (value) => email = value!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe o e-mail';
                      } else if (!value.contains('@')) {
                        return 'Insira um e-mail válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                    onSaved: (value) => password = value!,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, informe a senha';
                      } else if (value.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () => login(context),
              child: const Text('Entrar'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/register'),
              child: const Text('Criar conta'),
            ),
          ]
        )
      )
    );
  }
}
