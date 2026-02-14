import 'package:flutter/material.dart';

void main() {
  runApp(const TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  const TabBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car_outlined)),
                Tab(icon: Icon(Icons.directions_transit_outlined)),
                Tab(icon: Icon(Icons.directions_bike_outlined)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
        ),
      ),
    );
  }
}
