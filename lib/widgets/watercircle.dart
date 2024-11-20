import 'package:flutter/material.dart';
import 'package:ippodiscipline/main.dart';
import 'dart:math';

import 'package:ippodiscipline/providers/colorchanger_model.dart';
import 'package:provider/provider.dart';

class WaterAnimationCircle extends StatefulWidget {
  const WaterAnimationCircle({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WaterAnimationCircleState createState() => _WaterAnimationCircleState();
}

class _WaterAnimationCircleState extends State<WaterAnimationCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Repeats the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 100, // Circle diameter
        height: 100,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              painter: WavePainter(
                  _controller.value, context.watch<ColorChanger>().color),
            );
          },
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double animationValue;
  final Color color;

  WavePainter(this.animationValue, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.7) // Water color
      ..style = PaintingStyle.fill;

    final path = Path();
    final waveHeight = size.height * 0.05;
    final waveLength = size.width / 2;

    path.moveTo(0, size.height / 2);

    // Create the wave pattern
    for (double x = 0; x <= size.width; x++) {
      double y = waveHeight *
              sin((2 * pi * x / waveLength) - (2 * pi * animationValue)) +
          size.height / 2;
      path.lineTo(x, y);
    }

    // Close the path
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
