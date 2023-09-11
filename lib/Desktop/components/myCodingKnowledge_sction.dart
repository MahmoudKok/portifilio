import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../models/codingModel.dart';

// ignore: must_be_immutable
class MyCodingKnowledgeScreen extends StatelessWidget {
  MyCodingKnowledgeScreen({
    Key? key,
  }) : super(key: key);
  List<CodeKnowledgeModel> codeknowledge = [
    CodeKnowledgeModel(
      name: 'Flutter',
      percent: 70,
      photo: 'assets/images/coding/flutter.png',
    ),
    CodeKnowledgeModel(
      name: 'Dart',
      percent: 70,
      photo: 'assets/images/coding/dart.png',
    ),
    CodeKnowledgeModel(
      name: 'C++',
      percent: 80,
      photo: 'assets/images/coding/c++.png',
    ),
    CodeKnowledgeModel(
      name: 'Java',
      percent: 60,
      photo: 'assets/images/coding/java.png',
    ),
    CodeKnowledgeModel(
      name: 'Python',
      percent: 60,
      photo: 'assets/images/coding/flutter.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Responsive res = Responsive();
    bool isWideScreen = res.isDesktop(context);
    return Container(
      decoration: BoxDecoration(
        color: kcomponentBackground, // Choose your preferred color
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "My Coding Knowledge",
            style: headlabel(isWideScreen),
          ),
          const SizedBox(height: 20.0),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isWideScreen ? 4 : 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: codeknowledge.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final knowledge = codeknowledge[index];
              return CodingItem(
                  screenWidth: screenWidth,
                  knowledge: knowledge,
                  isWideScreen: isWideScreen,
                  screenHeight: screenHeight);
            },
          ),
        ],
      ),
    );
  }
}

class CodingItem extends StatefulWidget {
  final double screenWidth;
  final CodeKnowledgeModel knowledge;
  final bool isWideScreen;
  final double screenHeight;

  const CodingItem(
      {super.key, required this.screenWidth,
      required this.knowledge,
      required this.isWideScreen,
      required this.screenHeight});

  @override
  _CodingItemState createState() => _CodingItemState();
}

class _CodingItemState extends State<CodingItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double cardSize = widget.screenWidth * 0.2;
    double imageWidth = cardSize;
    double labelWidth = cardSize * 0.1;
    double indicatorSize = cardSize * 0.5;

    return GestureDetector(
      onTap: () {
        setState(() {
          isHovered = !isHovered;
        });
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isHovered ? cardSize * 1.1 : cardSize,
          height: isHovered ? cardSize * 1.1 : cardSize,
          decoration: BoxDecoration(
            color: isHovered ? konhoverpurble : kdarkpurble,
            borderRadius: BorderRadius.circular(10.0),
            border: isHovered
                ? Border.all(color: konhoverpurble, width: 2.0)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: imageWidth * 2,
                    height: imageWidth * 2,
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        scale: 0.8,
                        image: AssetImage(widget.knowledge.photo!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            widget.knowledge.name!,
                            style: GoogleFonts.signikaNegative(
                              fontSize: cardSize * 0.2,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.center,
                            child: OctagramStarShape(
                                size: cardSize *
                                    0.35, // Adjust the size of the hexagon
                                color: ktail3 // Change the color of the star
                                ),

                            /* HexagonShape(
                              size: cardSize *
                                  0.35, // Adjust the size of the hexagon
                              color: kpurble, // Change the color of the hexagon
                            ),*/
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: OctagramStarShape(
                              size: cardSize *
                                  0.2, // Adjust the size of the hexagon
                              color: ktail2.withOpacity(
                                  0.4), // Change the color of the star
                            ),

                            /* HexagonShape(
                              size: cardSize *
                                  0.35, // Adjust the size of the hexagon
                              color: kpurble, // Change the color of the hexagon
                            ),*/
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: OctagramStarShape(
                              size: cardSize *
                                  0.1, // Adjust the size of the hexagon
                              color: ktail2.withOpacity(
                                  0.2), // Change the color of the star
                            ),

                            /* HexagonShape(
                              size: cardSize *
                                  0.35, // Adjust the size of the hexagon
                              color: kpurble, // Change the color of the hexagon
                            ),*/
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "${widget.knowledge.percent!.toStringAsFixed(0)[0]}/10",
                              style: GoogleFonts.signikaNegative(
                                fontSize: cardSize * 0.1,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(cardSize * 0.05),
                    child: SizedBox(
                      width: widget.screenWidth * 0.8,
                      height: cardSize,
                      child: Center(
                        child: RatingBar(
                          rating: widget.knowledge.percent! ~/ 10,
                          size: (cardSize * 0.6) /
                              10, // Adjust the size as needed
                          filledColor: kpink,
                          emptyColor: kyellow,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int rating;
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const RatingBar({super.key, 
    required this.rating,
    this.size = 20.0,
    this.filledColor = kpink,
    this.emptyColor = kyellow,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> circles = List.generate(10, (index) {
      return _buildCircle(index < rating ? filledColor : emptyColor);
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: circles,
    );
  }

  Widget _buildCircle(Color color) {
    return Row(children: [
      Container(
        width: size,
        height: size,
        margin: EdgeInsets.all(size * 0.1),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
      SizedBox(
        width: size * 0.1,
      )
    ]);
  }
}

class HexagonShape extends StatelessWidget {
  final double size;
  final Color color;

  const HexagonShape({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: HexagonPainter(color),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color color;

  HexagonPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final List<Offset> points = [];

    for (int i = 0; i < 6; i++) {
      final double x = centerX + radius * cos(i * pi / 3);
      final double y = centerY + radius * sin(i * pi / 3);
      points.add(Offset(x, y));
    }

    final path = Path()..addPolygon(points, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class OctagramStarShape extends StatelessWidget {
  final double size;
  final Color color;

  const OctagramStarShape({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: OctagramStarPainter(color),
    );
  }
}

class OctagramStarPainter extends CustomPainter {
  final Color color;

  OctagramStarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = size.width / 2;

    final List<Offset> points = [];

    for (int i = 0; i < 8; i++) {
      final double x = centerX + radius * cos(i * pi / 4);
      final double y = centerY + radius * sin(i * pi / 4);
      points.add(Offset(x, y));
    }

    final path = Path()..addPolygon(points, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
