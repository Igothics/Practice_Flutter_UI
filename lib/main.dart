import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Design Practice : Update the UI based on orientation",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.pinkAccent,
            brightness: Brightness.light,
        ).harmonized(),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update the UI based on orientation",
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final columnCount = orientation == Orientation.portrait ? 2 : 3;
          return GridView.count(
            crossAxisCount: columnCount,
            children: List.generate(
              100,
              (index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Item $index",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
