import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Design Practice : Work with tabs",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pinkAccent,
          brightness: Brightness.light,
        ).harmonized(),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pinkAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.surfaceVariant;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tab Demo",
          ),
          bottom: const TabBar(
              tabs: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.directions_car,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.directions_transit,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.directions_bike,),
                ),
          ]),
        ),
        body: TabBarView(
            children: [
              Icon(Icons.directions_car, size: 120, color: iconColor,),
              Icon(Icons.directions_transit, size: 120, color: iconColor,),
              Icon(Icons.directions_bike, size: 120, color: iconColor,),
        ]),
      ),
    );
  }
}
