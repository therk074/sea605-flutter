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
    return Container(
      color: Colors.blueGrey,
      // margin: EdgeInsets.all(10),
      // margin: const EdgeInsets.fromLTRB(10, 1, 9, 30),
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
    );
  }
}