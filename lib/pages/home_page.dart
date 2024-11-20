import 'package:flutter/material.dart';
import 'package:ippodiscipline/main.dart';
import 'package:ippodiscipline/providers/colorchanger_model.dart';
import 'package:provider/provider.dart';

import '../widgets/example.dart';
import '../widgets/watercircle.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 200),
            const Row(
              children: [
                WaterAnimationCircle(),
                SizedBox(width: 5),
                WaterAnimationCircle(),
                SizedBox(width: 5),
                WaterAnimationCircle(),
                SizedBox(width: 5),
                WaterAnimationCircle(),
                SizedBox(width: 5),
              ],
            ),
            const SizedBox(height: 10),
            const ExampleCircle(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      context.read<ColorChanger>().changeColor("red"),
                  child: const Text('red'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () =>
                      context.read<ColorChanger>().changeColor("green"),
                  child: const Text('green'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () =>
                      context.read<ColorChanger>().changeColor("pink"),
                  child: const Text('pink'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CircleProgressWidget extends StatelessWidget {
  const CircleProgressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Diameter of the circle
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.blue, // Background color of the circle
        shape: BoxShape.circle, // Makes the Container circular
      ),
    );
  }
}
