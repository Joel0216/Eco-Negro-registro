import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedLogo extends StatefulWidget {
  final double size;

  const AnimatedLogo({super.key, this.size = 100});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          size: Size(widget.size, widget.size),
          painter: LogoPainter(
            animation: _controller.value,
            primaryColor: Theme.of(context).colorScheme.primary,
            secondaryColor: Theme.of(context).colorScheme.secondary,
          ),
        );
      },
    );
  }
}

class LogoPainter extends CustomPainter {
  final double animation;
  final Color primaryColor;
  final Color secondaryColor;

  LogoPainter({
    required this.animation,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Círculo exterior pulsante
    final outerPaint = Paint()
      ..color = primaryColor.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final pulseRadius = radius + (math.sin(animation * 2 * math.pi) * 10);
    canvas.drawCircle(center, pulseRadius, outerPaint);

    // Hexágono rotante
    final hexPath = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60 + animation * 360) * math.pi / 180;
      final x = center.dx + radius * 0.7 * math.cos(angle);
      final y = center.dy + radius * 0.7 * math.sin(angle);
      if (i == 0) {
        hexPath.moveTo(x, y);
      } else {
        hexPath.lineTo(x, y);
      }
    }
    hexPath.close();

    final hexPaint = Paint()
      ..color = secondaryColor.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawPath(hexPath, hexPaint);

    // Círculo central
    final centerPaint = Paint()
      ..shader = RadialGradient(
        colors: [primaryColor, secondaryColor],
      ).createShader(Rect.fromCircle(center: center, radius: radius * 0.4));

    canvas.drawCircle(center, radius * 0.4, centerPaint);

    // Partículas orbitando
    for (int i = 0; i < 3; i++) {
      final particleAngle =
          (animation * 360 + i * 120) * math.pi / 180;
      final particleX = center.dx + radius * 0.5 * math.cos(particleAngle);
      final particleY = center.dy + radius * 0.5 * math.sin(particleAngle);

      final particlePaint = Paint()
        ..color = primaryColor
        ..style = PaintingStyle.fill;

      canvas.drawCircle(Offset(particleX, particleY), 4, particlePaint);
    }
  }

  @override
  bool shouldRepaint(LogoPainter oldDelegate) => true;
}
