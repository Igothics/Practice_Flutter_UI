import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final visibleStateProvider = StateProvider((ref) => true);
final opacityProvider = Provider((ref) => ref.watch(visibleStateProvider) ? 1.0 : 0.0);

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visible = ref.watch(visibleStateProvider);
    final opacityState = ref.watch(opacityProvider);
    final animationController = useAnimationController(duration: const Duration(seconds: 1));

    void toggleButton() {
      ref.read(visibleStateProvider.notifier).update((state) => !state);
      visible ? animationController.forward() : animationController.reverse();
    }

    return MaterialApp(
      title: "Animation Practice : Fade a widget in and out",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.amber, brightness: Brightness.light,),
          useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Fade a widget in and out",),),
        body: Center(child: AnimatedOpacity(
          opacity: opacityState,
          duration: const Duration(seconds: 1),
          child: Container(width: 120, height: 120, color: Colors.green,),
        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: toggleButton,
          child: AnimatedIcon(
              icon: AnimatedIcons.add_event,
              progress: animationController,
          ),
        ),
      ),
    );
  }
}
