import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled/adapters/todo.dart';

import 'create_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Todo Items'),
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<Todo>('todos').listenable(),
          builder: (context, Box<Todo> box, widget) {
            if (box.values.isEmpty) {
              return const Center(
                child: Text("No data available"),
              );
            }
            return ListView.builder(
              itemCount: box.values.length,
              itemBuilder: (context, index) {
                Todo? obj = box.getAt(index);
                return ListTile(
                  title: Text(obj!.note),
                  subtitle: Text(obj.task),
                  onLongPress: () {
                    box
                        .deleteAt(index)
                        .then((value) => print("Item deleted"));
                  },
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTodoScreen()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
