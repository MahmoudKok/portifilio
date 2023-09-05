import 'package:flutter/material.dart';
import 'package:portifilio/Desktop/components/contact_section.dart';
import 'package:portifilio/Desktop/components/mySkills_section.dart';
import 'package:portifilio/helpers/constants.dart';

import 'components/MyExperince_section.dart';
import 'components/aboutMe_section.dart';
import 'components/landing_section.dart';
import 'components/myCodingKnowledge_sction.dart';
import 'components/myProjects_section.dart';

class DesktopMainScreen extends StatelessWidget {
  const DesktopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kbackground,
      body: ListView(
        children: [
          LandingSection(),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          AboutMeSection(),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          MySkillsSection(),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          MyCodingKnowledgeScreen(),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          MyExperincesScreen(),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          MyProjectsScreen(),
          SizedBox(
            height: screenHeight * 0.05,
          ),
          ContactSection(),
        ],
      ),
    );
  }
}
