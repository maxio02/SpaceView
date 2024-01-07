import 'dart:math';
import 'package:flutter/material.dart';

class Circle {
  Offset position;
  Offset direction;
  double radius;

  Circle(this.position, this.direction, this.radius);
}

extension CustomThemeColors on ThemeData {
  Color get circleColor => this.brightness == Brightness.light 
      ? Color.fromARGB(120, 0, 0, 0) // Color for light theme
      : Color.fromARGB(124, 255, 255, 255);  // Color for dark theme
}

class FloatingCirclesBg extends StatefulWidget {
  @override
  _FloatingCirclesBgState createState() => _FloatingCirclesBgState();
}

class _FloatingCirclesBgState extends State<FloatingCirclesBg> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  List<Circle> _circles = [];
  final int numberOfCircles = 30;
  final Random random = Random();
  Size _size = Size.zero;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2))
      ..addListener(() {
        updateCircles();
      })
      ..repeat();
    initializeCircles();
  }

void initializeCircles() {
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    if (mounted) {
      _size = context.size ?? Size.zero;
      double radius;
      _circles.clear();

      for (int i = 0; i < numberOfCircles; i++) {
        radius = random.nextDouble() * 10 + 15;
        _circles.add(Circle(
          Offset(
            random.nextDouble() * (_size.width - 2 * radius) + radius,
            random.nextDouble() * (_size.height - 2 * radius) + radius
          ), 
          Offset(random.nextDouble() * 1 - 0.5, random.nextDouble() * 1 - 0.5),
          radius
        ));
      }

      setState(() {});
    }
  });
}

  void updateCircles() {
    for (var circle in _circles) {
      Offset newPos = circle.position + circle.direction;
      
      // Bounce off the walls
      if (newPos.dx <= circle.radius || newPos.dx >= _size.width - circle.radius) {
        circle.direction = Offset(-circle.direction.dx, circle.direction.dy);
      }
      if (newPos.dy <= circle.radius || newPos.dy >= _size.height - circle.radius) {
        circle.direction = Offset(circle.direction.dx, -circle.direction.dy);
      }

      circle.position += circle.direction;
    }

    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return CustomPaint(
    painter: CirclePainter(_circles, Theme.of(context).circleColor),
    child: Container(),
  );
}
}

class CirclePainter extends CustomPainter {
  final List<Circle> circles;
  final Color circleColor;

  CirclePainter(this.circles, this.circleColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = circleColor;
    for (var circle in circles) {
      canvas.drawCircle(circle.position, circle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}