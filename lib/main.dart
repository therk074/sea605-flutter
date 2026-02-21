import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '67130700323',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Layout Exam.'),
          centerTitle: true,
        ),
        body: Center(child: buildColumn()),
      ),
    );
  }

  Widget buildColumn() => Column(
        children: [
          Image.asset('assets/images/tak.jpg'),
          const Row(
            children: [
              Icon(Icons.favorite, color: Colors.pink),
              Icon(Icons.music_note, color: Colors.green),
              Icon(Icons.beach_access, color: Colors.blue),
              Text('My Std.ID is 67130700323'),
            ],
          ),
        ],
      );
}
