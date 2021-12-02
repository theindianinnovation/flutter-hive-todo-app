import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/adapters/todo.dart';
import 'package:untitled/screens/create_todo_screen.dart';
import 'package:untitled/screens/todolist_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hive Todo App ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoListScreen()
    );
  }
}
