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
      title: "Design Practice : Display a snackBar",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
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
    final snackBar = SnackBar(
      content: const Text("Yay! A SnackBar!"),
      action: SnackBarAction(label: "Undo", onPressed: () {}),
    );
    return Scaffold(
      appBar: AppBar(title: const Text("Display a snackBar",),),
      body: Center(
        child: ElevatedButton(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(snackBar),
          child: const Text("Show Snack Bar",),
        ),
      ),
    );
  }
}
