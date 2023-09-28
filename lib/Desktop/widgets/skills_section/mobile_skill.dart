import 'package:flutter/material.dart';
import 'package:portifilio/Desktop/models/skillModel.dart';
import 'package:portifilio/Desktop/widgets/skills_section/common.dart';
import 'package:portifilio/helpers/constants.dart';

class MobileSkill extends StatelessWidget {
  const MobileSkill({
    super.key,
    required this.isWideScreen,
    required this.mySkills,
    required this.screenWidth,
    required this.screenHeight,
  });

  final bool isWideScreen;
  final double screenHeight;
  final List<SkillModel> mySkills;
  final double screenWidth;

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
