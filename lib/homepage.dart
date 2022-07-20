import 'package:flutter/material.dart';
import 'package:practice_flutter_ui/router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HomePage",),),
      body: Center(
        child: ElevatedButton(
          onPressed: ()=> Navigator.of(context).push(createRoute()),
          child: const Text("Go!",),
        ),
      ),
    );
  }
}
