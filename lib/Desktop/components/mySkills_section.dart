import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../models/skillModel.dart';

// ignore: must_be_immutable
class MySkillsSection extends StatelessWidget {
  MySkillsSection({
    Key? key,
  }) : super(key: key);

  List<SkillModel> mySkills = [
    SkillModel(
      name: 'Git',
      explain:
          'Proficient in version control with Git for managing project repositories.',
      photo: 'assets/images/skills/github.png',
    ),
    SkillModel(
      name: 'Algorithm',
      explain:
          'Skilled in designing and implementing efficient algorithms for various applications.',
      photo: 'assets/images/skills/algo.png',
    ),
    SkillModel(
      explain:
          'Adept at solving complex programming problems using algorithms and data structures.',
      photo: 'assets/images/skills/problem_solving.png',
      name: 'Problem Solving',
    ),
    SkillModel(
      explain:
          'Experienced in developing AI search algorithms for solving real-world problems.',
      photo: 'assets/images/skills/search_ai.png',
      name: 'AI Search Algorithms',
    ),
    SkillModel(
      explain:
          'Proficient in creating and developing cross-platform mobile apps using the Flutter framework.',
      photo: 'assets/images/skills/app_develop.png',
      name: 'App Development',
    ),
    SkillModel(
      explain:
          'Active participant in ICPC competitive programming contests, honing problem-solving skills.',
      photo: 'assets/images/skills/cp.png',
      name: 'Competitive Programming',
    ),
    SkillModel(
      explain:
          'Skilled in handling APIs and building full-stack apps with backend and database integration.',
      photo: 'assets/images/skills/resfulApi.png',
      name: 'RESTful APIs',
    ),
    SkillModel(
      name: 'Firebase',
      explain:
          'Proficient in using Firebase for app development, including backend, storage, and real-time database features.',
      photo: 'assets/images/skills/firebaselogo.png',
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
            "My Skills",
            style: headlabel(isWideScreen),
          ),
          const SizedBox(height: 20.0),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isWideScreen ? 4 : 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemCount: mySkills.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final skill = mySkills[index];
              return SkillItem(
                screenWidth: screenWidth,
                skill: skill,
                isWideScreen: isWideScreen,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SkillItem extends StatefulWidget {
  final SkillModel skill;
  final double screenWidth; // Add screenWidth
  final bool isWideScreen;

  const SkillItem(
      {super.key, required this.skill,
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
    double imageSize = widget.isWideScreen
        ? widget.screenWidth * 0.04
        : widget.screenWidth * 0.03;
    double fontSize = widget.isWideScreen ? 16.0 : 12.0;

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
      {super.key, required this.skill,
      required this.isWideScreen,
      required this.cardSize,
      required this.hoverCardSize});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                skill.name!,
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: hoverCardSize * 0.2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                skill.explain!,
                style: GoogleFonts.openSans(
                    color: Colors.white, fontSize: hoverCardSize * 0.1),
              ),
            ],
          ),
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
      {super.key, required this.skill,
      required this.isWideScreen,
      required this.cardSize,
      required this.hoverCardSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: cardSize * 2,
      height: cardSize * 2,
      child: Padding(
        padding: EdgeInsets.all(cardSize * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 8,
              child: Image.asset(
                skill.photo!,
                width: cardSize,
                height: cardSize,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                skill.name!,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: isWideScreen ? 22 : 18,
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
