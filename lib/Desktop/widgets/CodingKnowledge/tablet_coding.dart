import 'package:flutter/material.dart';
import 'package:portifilio/Desktop/models/codingModel.dart';
import 'package:portifilio/Desktop/widgets/CodingKnowledge/common.dart';
import 'package:portifilio/helpers/constants.dart';

class TabletCoding extends StatelessWidget {
  const TabletCoding({
    super.key,
    required this.isWideScreen,
    required this.codeknowledge,
    required this.screenWidth,
    required this.screenHeight,
  });

  final bool isWideScreen;
  final List<CodeKnowledgeModel> codeknowledge;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
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
              crossAxisCount: 3,
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
