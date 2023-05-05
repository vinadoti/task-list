import 'package:flutter/material.dart';
import 'views/app.dart';
import 'package:firebase_core/firebase_core.dart';

const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyCS4W6MtqK4UsKp9yh3P2UKsW19roHTHGI",
    authDomain: "task-list-3d942.firebaseapp.com",
    projectId: "task-list-3d942",
    storageBucket: "task-list-3d942.appspot.com",
    messagingSenderId: "137597499883",
    appId: "1:137597499883:web:b03a81d7c4a60d9206c1ae");

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(App());
}
