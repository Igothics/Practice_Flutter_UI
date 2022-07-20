import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_flutter_ui/models/person_model.dart';
import 'package:practice_flutter_ui/person_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

final countProvider = StateProvider((ref) => 0);
final titleProvider = Provider((ref) => "Practice M3 - Riverpod");
final isDarkProvider = StateProvider((ref) => false);
final brightnessProvider = StateProvider(
    (ref) => ref.watch(isDarkProvider) ? Brightness.dark : Brightness.light);
final actionIconProvider = Provider((ref) => ref.watch(isDarkProvider)
    ? const Icon(Icons.sunny)
    : const Icon(Icons.nightlight_outlined));
const person01 = Person(name: "Igothics", email: "Igothics@gmail.com", age: 35);
const person02 =
    Person(name: "Vu Trong Khoa", email: "Igothics@gmail.com", age: 35);

class MyApp extends HookConsumerWidget {
  MyApp({Key? key}) : super(key: key);
  final _router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
          name: "person",
          path: "/Person/:fid",
          builder: (context, state) {
            debugPrint('location: ${state.location}');
            debugPrint('${state.params['fid']} approached');
            return const PersonPage(
              person: person01,
            );
          }),
      GoRoute(
          name: "other",
          path: "/Other",
          builder: (context, state) {
            debugPrint('location: ${state.location}');
            debugPrint('query: ${state.queryParams}');
            return const PersonPage(
              person: person02,
            );
          })
    ],
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = ref.watch(brightnessProvider);

    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: "Flutter UI Practice",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
          brightness: brightness,
        ).harmonized(),
        useMaterial3: true,
      ),
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
    useValueChanged(
        count,
        (oldValue, oldResult) =>
            debugPrint("Count change to $count from $oldValue"));

    void pushPersonPage() =>
        context.pushNamed("person", params: {'fid': 'person01'});
    void pushOtherPage() => context.push("/Other?filter=profile");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textTheme.headlineMedium,
        ),
        actionsIconTheme: const IconThemeData(opacity: 0.7),
        actions: [
          IconButton(
              onPressed: () =>
                  ref.read(isDarkProvider.notifier).update((state) => !state),
              icon: actionThemeIcon),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '$count',
              style: textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: pushPersonPage,
              child: const Text(
                "Go to Person page",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: pushOtherPage,
              child: const Text(
                "Go to Other page",
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(countProvider.notifier).state++,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
