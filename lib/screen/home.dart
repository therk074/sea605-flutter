import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30), //กล่องกับข้างนอก
      padding: EdgeInsets.all(20), //กล่องกับตัวwidget childข้างใน
      child: const Text(
        "Test",
        style: TextStyle(fontSize: 30, letterSpacing: 3),
      ),
    );
  }
}