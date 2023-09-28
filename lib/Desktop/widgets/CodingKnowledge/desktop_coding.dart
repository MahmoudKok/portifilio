import 'package:flutter/material.dart';
import 'package:portifilio/Desktop/models/codingModel.dart';
import 'package:portifilio/Desktop/widgets/CodingKnowledge/common.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:sizer/sizer.dart';

class DesktopCoding extends StatelessWidget {
  const DesktopCoding({
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
            maxLines: 1,
            style: headlabel(isWideScreen),
          ),
          SizedBox(height: 1.h),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 2.w,
              mainAxisSpacing: 2.h,
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
