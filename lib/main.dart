import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Title',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: const Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Title'),
          SizedBox(height: 8),
          Text('Subtitle'),
          ElevatedButton(onPressed: null, child: Text('Button')),
        ],
      ),
    );
  }
}
