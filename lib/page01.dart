import 'package:flutter/material.dart';

class Page01 extends StatelessWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page01"),),
      body: const Center(child: Text("This is page 01"),),
    );
  }
}
