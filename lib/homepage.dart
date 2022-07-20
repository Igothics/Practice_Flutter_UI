import 'package:flutter/material.dart';
import 'package:practice_flutter_ui/draggable_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page",),
      ),
      body: DraggableCard(child: const FlutterLogo(size: 120,),),
    );
  }
}
