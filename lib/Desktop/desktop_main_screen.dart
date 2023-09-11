import 'package:flutter/material.dart';
import 'package:portifilio/helpers/constants.dart';

import 'components/landing_section.dart';

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
          // AboutMeSection(),
          // SizedBox(
          //   height: screenHeight * 0.05,
          // ),
          // MySkillsSection(),
          // SizedBox(
          //   height: screenHeight * 0.05,
          // ),
          // MyCodingKnowledgeScreen(),
          // SizedBox(
          //   height: screenHeight * 0.05,
          // ),
          // MyExperincesScreen(),
          // SizedBox(
          //   height: screenHeight * 0.05,
          // ),
          // const MyProjectsScreen(),
          // SizedBox(
          //   height: screenHeight * 0.05,
          // ),
          // ContactSection(),
        ],
      ),
    );
  }
}
