import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My Title',
    home: Scaffold(
      appBar:AppBar(
        title: const Text("My App"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: const Home(),
    ),
  ));
}

class Home extends StatelessWidget {
  const Home ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Hello Flutter Content");
  }
}