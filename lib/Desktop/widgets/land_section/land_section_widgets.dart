import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:portifilio/Desktop/controllers/Animted_text_controller.dart';
import 'package:portifilio/Desktop/controllers/random_circles_controller.dart';

import '/../../helpers/constants.dart';

class RandomCirclesWithLines extends StatefulWidget {
  const RandomCirclesWithLines({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
    required this.numberOfCircles,
    required this.isDesktop,
  });
  final bool isDesktop;
  final double containerHeight;
  final double containerWidth;
  final int numberOfCircles;

  @override
  _RandomCirclesWithLinesState createState() => _RandomCirclesWithLinesState();
}

class _RandomCirclesWithLinesState extends State<RandomCirclesWithLines>
    with TickerProviderStateMixin {
  List<Offset> points = []; // Store the positions of generated points
  List<Color> shadesOfYellow = [
    kyellow,
    const Color.fromARGB(255, 248, 209, 49),
    const Color.fromARGB(255, 230, 204, 99),
    const Color.fromARGB(255, 222, 179, 6),
    // kpink,
    // const Color.fromARGB(255, 248, 78, 183),
    // const Color.fromARGB(255, 255, 181, 227),
    // const Color.fromARGB(255, 132, 5, 83),
  ];

  List<Offset> velocities = [];

  late AnimationController _animationController;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);

    // Add listener to update the UI on each animation frame
    _animationController.addListener(() {
      setState(() {
        updateCirclePositions();
      });
    });

    // Initialize points and add initial positions for circles
    for (int i = 0; i < widget.numberOfCircles; i++) {
      points.add(generateRandomPosition());
      velocities.add(generateRandomVelocity());
    }
  }

  // Function to generate a random position within the container
  Offset generateRandomPosition() {
    Random random = Random();
    double x = random.nextDouble() *
        (widget.containerWidth - 20); // 20 is the circle's width
    double y = random.nextDouble() *
        (widget.containerHeight - 20); // 20 is the circle's height
    return Offset(x, y);
  }

  // Function to generate a random velocity for the circles
  Offset generateRandomVelocity() {
    Random random = Random();
    double vx = random.nextDouble() * 2 - 1; // Random value between -1 and 1
    double vy = random.nextDouble() * 2 - 1; // Random value between -1 and 1
    return Offset(vx, vy);
  }

  // Function to update the positions of circles
  void updateCirclePositions() {
    for (int i = 0; i < widget.numberOfCircles; i++) {
      points[i] += velocities[i];

      // Bounce off the container edges
      if (points[i].dx < 0 || points[i].dx > widget.containerWidth - 20) {
        velocities[i] = Offset(-velocities[i].dx, velocities[i].dy);
      }
      if (points[i].dy < 0 || points[i].dy > widget.containerHeight - 20) {
        velocities[i] = Offset(velocities[i].dx, -velocities[i].dy);
      }
    }
  }

  // Function to create a random circle with a random position and color
  Widget createRandomCircle(Offset position) {
    Color randomYellowColor =
        shadesOfYellow[Random().nextInt(shadesOfYellow.length)];

    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Container(
        width: 20, // Adjust the size as needed
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: randomYellowColor,
        ),
      ),
    );
  }

  // Function to create lines between points
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

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (int i = 0; i < widget.numberOfCircles; i++) {
      children.add(createRandomCircle(points[i])); // Add a new circle
    }

    return SizedBox(
      width: widget.containerWidth,
      height: widget.containerHeight,
      child: Stack(
        children: [
          Positioned.fill(
            child: widget.isDesktop
                ? Stack(
                    children: [
                      ...createLinesBetweenCircles(), // Add lines between circles
                      ...children, // Add circles
                    ],
                  )
                : Stack(
                    children: [
                      ...createLinesBetweenCircles(),
                      ImageFiltered(
                          imageFilter:
                              ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                          child: SizedBox(
                            width: double.maxFinite,
                            child: Stack(
                              children: children,
                            ),
                          )),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          child: Image.asset(
                            "assets/images/land_screen.png",
                            height: widget.containerHeight,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  LinePainter(this.startPoint, this.endPoint, Color lineColor)
      : _paint = Paint()
          ..color = lineColor
          ..strokeCap = StrokeCap.round
          ..strokeWidth = 0.3; // Adjust the line thickness as needed

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

class AnimatedTextWidget extends StatelessWidget {
  final String label;
  final TextStyle style;
  final Duration animationDuration;

  AnimatedTextWidget({
    required this.label,
    required this.style,
    this.animationDuration = const Duration(milliseconds: 100),
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<TypewriterController>(
        TypewriterController(
          label,
          animationDuration,
        ),
        tag: label);

    return Obx(
      () => Text(
        controller.animatedText.value,
        style: style,
      ),
    );
  }
}
/*class AnimatedTextWidget extends StatefulWidget {
  final String label;
  final TextStyle style;
  final int typingSpeed; // Speed in milliseconds

  const AnimatedTextWidget({
    Key? key,
    required this.label,
    required this.style,
    this.typingSpeed = 1, // Default typing speed
  }) : super(key: key);

  @override
  _AnimatedTextWidgetState createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  late TextEditingController _textController;
  late Ticker _ticker;
  int currentIndex = 0;
  bool forward = true;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _ticker = Ticker(_onTick);
    _ticker.start();
  }

  void _onTick(Duration elapsed) {
    if (forward) {
      if (currentIndex <= widget.label.length) {
        setState(() {
          _textController.text = widget.label.substring(0, currentIndex);
          currentIndex++;
        });
      } else {
        forward = false;
        currentIndex = widget.label.length;
      }
    } else {
      if (currentIndex >= 0) {
        setState(() {
          _textController.text = widget.label.substring(0, currentIndex);
          currentIndex--;
        });
      } else {
        forward = true;
        currentIndex = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      style: widget.style,
      enabled: false,
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _ticker.dispose();
    super.dispose();
  }
}*/
