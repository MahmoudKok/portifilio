import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifilio/helpers/constants.dart';

class CirclesController extends GetxController {
  RxList<Offset> points = <Offset>[].obs;
  RxList<Color> shadesOfYellow = [
    kyellow,
    const Color.fromARGB(255, 248, 209, 49),
    const Color.fromARGB(255, 230, 204, 99),
    const Color.fromARGB(255, 222, 179, 6),
  ].obs;
  RxList<Offset> velocities = <Offset>[].obs;

  @override
  void onInit() {
    super.onInit();

    for (int i = 0; i < 100; i++) {
      points.add(generateRandomPosition());
      velocities.add(generateRandomVelocity());
    }

    ever(points, (_) {
      updateCirclePositions();
    });

    _startAnimation();
  }

  void _startAnimation() {
    const duration = Duration(milliseconds: 16);
    Timer.periodic(duration, (_) {
      for (int i = 0; i < points.length; i++) {
        points[i] += velocities[i];

        // Bounce off the container edges
        if (points[i].dx < 0 || points[i].dx > Get.width - 20) {
          velocities[i] = Offset(-velocities[i].dx, velocities[i].dy);
        }
        if (points[i].dy < 0 || points[i].dy > Get.height - 20) {
          velocities[i] = Offset(velocities[i].dx, -velocities[i].dy);
        }
      }
    });
  }

  Offset generateRandomPosition() {
    Random random = Random();
    double x = random.nextDouble() * (Get.width - 20);
    double y = random.nextDouble() * (Get.height - 20);
    return Offset(x, y);
  }

  Offset generateRandomVelocity() {
    Random random = Random();
    double vx = random.nextDouble() * 2 - 1;
    double vy = random.nextDouble() * 2 - 1;
    return Offset(vx, vy);
  }

  List<Widget> createLinesBetweenCircles() {
    List<Widget> lines = [];

    if (points.length < 2) {
      return lines; // Not enough points to draw lines
    }

    for (int i = 1; i < points.length; i++) {
      lines.add(
        CustomPaint(
          painter: LinePainter(points[i - 1], points[i],
              shadesOfYellow[Random().nextInt(shadesOfYellow.length)]),
        ),
      );
    }

    return lines;
  }

  List<Widget> createRandomCircles() {
    List<Widget> circles = [];

    for (int i = 0; i < points.length; i++) {
      circles.add(
        createRandomCircle(points[i]),
      );
    }

    return circles;
  }

  Widget createRandomCircle(Offset position) {
    Color randomYellowColor =
        shadesOfYellow[Random().nextInt(shadesOfYellow.length)];

    return Positioned(
      left: position.dx,
      top: position.dy,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 1.0,
          sigmaY: 2.0,
          tileMode: TileMode.mirror,
        ),
        child: Container(
          width: 20, // Adjust the size as needed
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: randomYellowColor,
          ),
        ),
      ),
    );
  }

  void updateCirclePositions() {
    for (int i = 0; i < points.length; i++) {
      points[i] += velocities[i];

      // Bounce off the container edges
      if (points[i].dx < 0 || points[i].dx > Get.width - 20) {
        velocities[i] = Offset(-velocities[i].dx, velocities[i].dy);
      }
      if (points[i].dy < 0 || points[i].dy > Get.height - 20) {
        velocities[i] = Offset(velocities[i].dx, -velocities[i].dy);
      }
    }
  }
}

class LinePainter extends CustomPainter {
  LinePainter(this.startPoint, this.endPoint, Color lineColor)
      : _paint = Paint()
          ..color = lineColor
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 0.3;

  final Offset endPoint;
  final Offset startPoint;
  final Paint _paint;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(startPoint, endPoint, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
