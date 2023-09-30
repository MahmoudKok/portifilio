import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/Desktop/models/codingModel.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:portifilio/helpers/responsive.dart';
import 'package:sizer/sizer.dart';

class CodingItem extends StatefulWidget {
  final double screenWidth;
  final CodeKnowledgeModel knowledge;
  final bool isWideScreen;
  final double screenHeight;

  const CodingItem(
      {super.key,
      required this.screenWidth,
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
    double cardSize = 400.w;

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
          width: isHovered ? cardSize * 1.2 : cardSize * 1.5,
          height: isHovered ? cardSize * 1.2 : cardSize * 1.5,
          decoration: BoxDecoration(
            color: isHovered ? konhoverpurble : kdarkpurble,
            borderRadius: BorderRadius.circular(10.0),
            border: isHovered
                ? Border.all(color: konhoverpurble, width: 2.0)
                : null,
          ),
          child: FittedBox(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.sp),
                  child: CircleAvatar(
                    radius: 50.sp,
                    backgroundImage: AssetImage(widget.knowledge.photo!),
                  ),
                ),
                SizedBox(
                  height: 30.sp,
                ),
                SizedBox(
                  height: 80.sp,
                  width: 150.sp,
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FittedBox(
                          child: Text(
                            widget.knowledge.name!,
                            style: GoogleFonts.signikaNegative(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.bold,
                              color: white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.sp,
                        ),
                        OctagramStarShape(
                          size: 75.sp,
                          color: ktail3,
                          child: Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: Text(
                              "${widget.knowledge.percent!.toStringAsFixed(0)[0]}/10",
                              style: GoogleFonts.signikaNegative(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                SizedBox(
                  height: 20.sp,
                  width: 80.w,
                  child: Center(
                    child: FittedBox(
                      child: RatingBar(
                        rating: widget.knowledge.percent! ~/ 10,
                        size: (350.sp) / 10,
                        filledColor: kpink,
                        emptyColor: kyellow,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.sp)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 50.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.knowledge.photo!),
                      ),
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  SizedBox(
                    width: 50.w,
                    height: 10.h,
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              widget.knowledge.name!,
                              style: GoogleFonts.signikaNegative(
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          SizedBox(
                            width: 20.w,
                            height: 12.h,
                            child: Stack(children: [
                              Align(
                                alignment: Alignment.center,
                                child: OctagramStarShape(
                                    size: res.isDesktop(context) ? 8.h : 16.h,
                                    color: ktail3),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: OctagramStarShape(
                                  size: res.isDesktop(context) ? 6.h : 12.h,
                                  color: ktail2.withOpacity(0.4),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: OctagramStarShape(
                                  size: res.isDesktop(context) ? 4.h : 8.h,
                                  color: ktail2.withOpacity(0.2),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "${widget.knowledge.percent!.toStringAsFixed(0)[0]}/10",
                                  style: GoogleFonts.signikaNegative(
                                    fontSize:
                                        res.isDesktop(context) ? 12.sp : 16.sp,
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
                  ),
                  SizedBox(
                    width: 70.w,
                    height: 10.h,
                    child: Center(
                      child: RatingBar(
                        rating: widget.knowledge.percent! ~/ 10,
                        size: (40.w) / 10,
                        filledColor: kpink,
                        emptyColor: kyellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),*/
class RatingBar extends StatelessWidget {
  final int rating;
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const RatingBar({
    super.key,
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

class OctagramStarShape extends StatelessWidget {
  final double size;
  final Color color;
  final Widget child;

  const OctagramStarShape(
      {super.key,
      required this.size,
      required this.color,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: OctagramStarPainter(color),
      child: Center(
        child: child,
      ),
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
