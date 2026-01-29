import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Head01 Flutter layout',
      home: Scaffold(
        appBar: AppBar(title: const Text('Head02 Flutter layout')),
        body: const Center(
          child: Text(
            'Hello World Phatarisa',
            style: TextStyle(fontSize: 32, color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
