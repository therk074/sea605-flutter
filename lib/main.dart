import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home.dart';

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

