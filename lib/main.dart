import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Design Practice : Add a Drawer to a screen",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.light,
        ),
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
    final items = List.generate(5,
      (index) => ListTile(
        title: Text(
          "Item $index",
        ),
        onTap: () => Navigator.of(context).pop(),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a Drawer to a screen",),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: const Text(
                  "Drawer Header",
                ),
              ),
            ),
            ...items,
          ],
        ),
      ),
      body: const Center(
        child: Text("My Page!",),
      ),
    );
  }
}
