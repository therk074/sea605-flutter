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
      body: const Text("Body Flutter"),
    ),
  ));
}

