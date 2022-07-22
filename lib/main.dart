import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Design Practice : Use themes to share colors and font styles",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.notoSansGeorgian().fontFamily,
        textTheme: TextTheme(
          headline1: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          headline6: const TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14, fontFamily: GoogleFonts.hind().fontFamily),
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
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Custom Theme",
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: theme.colorScheme.secondary,
          child: Text(
            "Text with a background color",
            style: theme.textTheme.headline6,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: theme.copyWith(splashColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
