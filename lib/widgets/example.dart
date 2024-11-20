import 'package:flutter/material.dart';

class ExampleCircle extends StatelessWidget {
  const ExampleCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      ),
    );
  }
}
