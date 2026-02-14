import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(title: 'Navigation Basic', home: FirstRoute()));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (context) => SecondRoute()),
            );
          },
          child: Text('Open 2nd page'),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (context) => FirstRoute()),
            );
          },
          child: Text('Open 1st page'),
        ),
      ),
    );
  }
}
