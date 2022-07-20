import 'package:flutter/material.dart';
import 'package:practice_flutter_ui/models/person_model.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key, required this.person}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    person.sayHello();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Person Page",
          style: textTheme.headlineMedium,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${person.name}', style: textTheme.bodyLarge,),
            Text('Email: ${person.email}', style: textTheme.bodyMedium,),
            Text('Age: ${person.age}', style: textTheme.bodyMedium,),
          ],
        ),
      ),
    );
  }
}
