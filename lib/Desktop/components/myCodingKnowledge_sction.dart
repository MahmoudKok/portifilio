
import 'package:flutter/material.dart';
import 'package:portifilio/Desktop/widgets/CodingKnowledge/desktop_coding.dart';
import 'package:portifilio/Desktop/widgets/CodingKnowledge/mobile_coding.dart';
import 'package:portifilio/Desktop/widgets/CodingKnowledge/tablet_coding.dart';

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
      photo: 'assets/images/coding/python.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Responsive res = Responsive();
    bool isWideScreen = res.isDesktop(context);
    return res.isDesktop(context)
        ? DesktopCoding(
            isWideScreen: isWideScreen,
            codeknowledge: codeknowledge,
            screenWidth: screenWidth,
            screenHeight: screenHeight)
        : (res.isTablet(context)
            ? TabletCoding(
                isWideScreen: isWideScreen,
                codeknowledge: codeknowledge,
                screenWidth: screenWidth,
                screenHeight: screenHeight)
            : MobileCoding(
                isWideScreen: isWideScreen,
                codeknowledge: codeknowledge,
                screenWidth: screenWidth,
                screenHeight: screenHeight));
  }
}
