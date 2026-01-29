import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'H01 Flutter layout Row & Column',
      home: Scaffold(
        appBar: AppBar(title: Text('H02 Fluuter layout Row')),
        body: Center(child: buildRow()),
      ),
    );
  }

  Widget buildRow() => (Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('assets/images/pic1.jpg'),
    Image.asset('assets/images/pic2.jpg'),
    Image.asset('assets/images/pic3.jpg'),
  ],));
}
