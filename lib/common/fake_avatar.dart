import 'package:flutter/material.dart';

class FakeAvatar extends StatelessWidget {
  const FakeAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.pinkAccent],
          ),
        ),
        child: const Icon(
          Icons.ac_unit,
          color: Colors.white70,
        ),
      ),
    );
  }
}
