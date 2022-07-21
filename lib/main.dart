import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_flutter_ui/animated_params_notifier.dart';
import 'package:practice_flutter_ui/models/animated_params.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final animatedParamsNotifierProvider =
    StateNotifierProvider<AnimatedParamsNotifier, AnimatedParams>(
        (ref) => AnimatedParamsNotifier());

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final params = ref.watch(animatedParamsNotifierProvider);
    final controller = ref.watch(animatedParamsNotifierProvider.notifier);

    return MaterialApp(
      title: "Animate the properties of a container",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          brightness: Brightness.light,
        ).harmonized(),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Animated Container Practice",
          ),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: params.width,
            height: params.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(params.borderRadius),
                color: controller.getColor()),
            curve: Curves.ease,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.randomChange(),
          child: const Icon(Icons.add,),
        ),
      ),
    );
  }
}
