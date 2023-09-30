import 'package:flutter/material.dart';
import 'package:portifilio/Desktop/widgets/skills_section/desktop_skill.dart';
import 'package:portifilio/Desktop/widgets/skills_section/mobile_skill.dart';
import 'package:portifilio/Desktop/widgets/skills_section/tablet_skill.dart';

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
    return res.isDesktop(context)
        ? DesktopSkill(
            isWideScreen: isWideScreen,
            mySkills: mySkills,
            screenHeight: screenHeight,
            screenWidth: screenWidth)
        : (res.isTablet(context)
            ? TabletSkill(
                isWideScreen: isWideScreen,
                mySkills: mySkills,
                screenWidth: screenWidth,
                screenHeight: screenHeight)
            : MobileSkill(
                isWideScreen: isWideScreen,
                mySkills: mySkills,
                screenWidth: screenWidth,
                screenHeight: screenHeight));
  }
}
