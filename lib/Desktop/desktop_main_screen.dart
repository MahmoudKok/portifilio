import 'package:flutter/material.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:portifilio/helpers/responsive.dart';

import 'components/aboutMe_section.dart';
import 'components/contact_section.dart';
import 'components/landing_section.dart';
import 'components/myCodingKnowledge_sction.dart';
import 'components/myExperince_section.dart';
import 'components/myProjects_section.dart';
import 'components/mySkills_section.dart';

class DesktopMainScreen extends StatelessWidget {
  const DesktopMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Responsive res = Responsive();
    if (res.isDesktop(context)) {
      print('Desktop');
    } else if (res.isTablet(context)) {
      print('Tablet');
    } else {
      print('Mobile');
    }
    print('screenWidth : $screenWidth');
    print('screenHeight : $screenHeight');
    return Scaffold(
      backgroundColor: kbackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LandingSection(),
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
            const MyExperincesScreen(),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            const MyProjectsScreen(),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
