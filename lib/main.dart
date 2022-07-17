import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_flutter_ui/models/person_model.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final countProvider = StateProvider((ref) => 0);
final titleProvider = Provider((ref) => "Practice M3 - Riverpod");
final isDarkProvider = StateProvider((ref) => false);
final brightnessProvider = StateProvider((ref) => ref.watch(isDarkProvider) ? Brightness.dark : Brightness.light);
final actionIconProvider = Provider((ref) => ref.watch(isDarkProvider) ? const Icon(Icons.sunny) : const Icon(Icons.nightlight_outlined));
const person01 = Person(name: "Igothics", email: "Igothics@gmail.com", age: 35);

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = ref.watch(brightnessProvider);

    return MaterialApp(
      title: 'Flutter UI Practice',
      theme: ThemeData(
        colorSchemeSeed: Colors.redAccent,
        brightness: brightness,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(titleProvider);
    final count = ref.watch(countProvider);
    final actionThemeIcon = ref.watch(actionIconProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: textTheme.headlineMedium,),
        actionsIconTheme: const IconThemeData(opacity: 0.7),
        actions: [
          IconButton(onPressed: ()=> ref.read(isDarkProvider.notifier).update((state) => !state), icon: actionThemeIcon),
          const SizedBox(width: 10,),
        ],
      ),
      body: Center(
        child: Text('$count',style: textTheme.displayLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(countProvider.notifier).state++,
        child: const Icon(Icons.add,),
      ),
    );
  }
}
