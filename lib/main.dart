import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter_ui/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: "Animation Practice: Page Route Animation",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ).harmonized(),
        useMaterial3: true,
      ),
    );
  }
}
