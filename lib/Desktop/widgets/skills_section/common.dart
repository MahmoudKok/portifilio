import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/helpers/responsive.dart';
import 'package:sizer/sizer.dart';

import '../../../helpers/constants.dart';
import '../../models/skillModel.dart';

class SkillItem extends StatefulWidget {
  final SkillModel skill;
  final double screenWidth; // Add screenWidth
  final bool isWideScreen;

  const SkillItem(
      {super.key,
      required this.skill,
      required this.isWideScreen,
      required this.screenWidth});

  @override
  _SkillItemState createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double cardSize = widget.isWideScreen
        ? widget.screenWidth * 0.12
        : widget.screenWidth * 0.1;
    double hoverCardSize = widget.isWideScreen
        ? widget.screenWidth * 0.13
        : widget.screenWidth * 0.11;

    return MouseRegion(
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
        width: isHovered ? hoverCardSize : cardSize,
        height: isHovered ? hoverCardSize : cardSize,
        decoration: BoxDecoration(
          color: isHovered ? konhoverpurble : kdarkpurble,
          borderRadius: BorderRadius.circular(10.0),
          border:
              isHovered ? Border.all(color: konhoverpurble, width: 2.0) : null,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isHovered
              ? SkillCardText(
                  skill: widget.skill,
                  isWideScreen: widget.isWideScreen,
                  cardSize: cardSize,
                  hoverCardSize: hoverCardSize,
                )
              : SkillCardImage(
                  skill: widget.skill,
                  isWideScreen: widget.isWideScreen,
                  cardSize: cardSize,
                  hoverCardSize: hoverCardSize,
                ),
        ),
      ),
    );
  }
}

class SkillCardText extends StatelessWidget {
  final SkillModel skill;
  final bool isWideScreen;
  final double cardSize;
  final double hoverCardSize;

  const SkillCardText(
      {super.key,
      required this.skill,
      required this.isWideScreen,
      required this.cardSize,
      required this.hoverCardSize});

  @override
  Widget build(BuildContext context) {
    var rs = Responsive();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                skill.name!,
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              flex: 2,
              child: Text(
                skill.explain!,
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: rs.isDesktop(context)
                        ? 8.sp
                        : (rs.isTablet(context) ? 12.sp : 10.sp)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillCardImage extends StatelessWidget {
  final SkillModel skill;
  final bool isWideScreen;
  final double cardSize;
  final double hoverCardSize;

  const SkillCardImage(
      {super.key,
      required this.skill,
      required this.isWideScreen,
      required this.cardSize,
      required this.hoverCardSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardSize * 3,
      height: cardSize * 3,
      child: Padding(
        padding: EdgeInsets.all(cardSize * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                skill.photo!,
              ),
            ),
            FittedBox(
              child: Text(
                skill.name!,
                maxLines: 1,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: isWideScreen ? 22 : 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
