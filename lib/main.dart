import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_flutter_ui/homepage.dart';

void main(){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      title: "Animation Practice: Animate a widget using a physics simulation",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red, brightness: Brightness.light),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
