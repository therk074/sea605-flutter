import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(title: 'Passing Data',
    home: TodoScreen(
      todos:List.generate(20, (index) => Todo(title: 'Todo $index', description: 'A description of what needs to be done for Todo $index')),
    ),)
  );
}

class Todo {
  final String title;
  final String description;
  Todo({required this.title, required this.description});
}

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key,required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(context, MaterialPageRoute<void>(builder: (context) => DetailScreen(todo: todos[index])));
            },
          );
        },
      ),
    );
  }
}
 class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(todo.description),
      ),
    );
  }
}