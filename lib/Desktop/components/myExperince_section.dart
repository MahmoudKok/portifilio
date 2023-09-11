import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../models/experinceModel.dart';

class MyExperincesScreen extends StatelessWidget {
  MyExperincesScreen({super.key});
  List<ExperinceModel> experince = [
    ExperinceModel(
      name: 'ICPC',
      explain:
          'Solved more than 500 problem about Dynamic programming,data structure and mathematics\nThree years participant in the ICPC programming competition.',
      photo: 'assets/images/experinces/icpc.jpg',
    ),
    ExperinceModel(
      name: 'Flutter',
      explain:
          '2 years of experience as a professional Flutter developer\nMy experience includes Firebase Firestore, Dart, Local Storage, version control such as Git and GitHub, Connecting Flutter applications to back-ends, json_serializable, Bloc, Getx.',
      photo: 'assets/images/experinces/flutter_bird.png',
    ),
    ExperinceModel(
      name: 'shAi trainer',
      explain:
          'I am a trainee in the company, and we are training to create real and achievable projects on thefield of work and of real benefit. I have successfully completed the first level with an acceptable average, and now I am in the second level',
      photo: 'assets/images/experinces/shai.jpg',
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
        color: kcomponentBackground, // Use your preferred color
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "My Experiences",
            style: headlabel(isWideScreen),
          ),
          const SizedBox(height: 20.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Allow horizontal scrolling
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: experince.map((experience) {
                return Row(
                  children: [
                    ExperienceItem(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                      experience: experience,
                      isWideScreen: isWideScreen,
                    ),
                    SizedBox(
                        width: screenWidth *
                            0.05), // Add spacing between items (adjust as needed)
                  ],
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class ExperienceItem extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  final ExperinceModel experience;
  final bool isWideScreen;

  const ExperienceItem(
      {super.key, required this.screenWidth,
      required this.experience,
      required this.isWideScreen,
      required this.screenHeight});

  @override
  _ExperienceItemState createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double cardSize = widget.isWideScreen
        ? widget.screenWidth * 0.3
        : widget.screenWidth * 0.1;
    double imageWidth = cardSize * 0.6;
    double labelWidth = cardSize * 0.4;

    return GestureDetector(
      onTap: () {
        setState(() {
          isHovered = !isHovered;
        });
      },
      child: MouseRegion(
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
          width: cardSize,
          height: cardSize * 1.3,
          decoration: BoxDecoration(
            color: isHovered ? konhoverpurble : kdarkpurble,
            borderRadius: BorderRadius.circular(20.0),
            border: isHovered
                ? Border.all(color: konhoverpurble, width: 2.0)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isHovered
                  ? Padding(
                      padding: EdgeInsets.all(cardSize * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.experience.name!,
                            style: GoogleFonts.raleway(
                              fontSize: labelWidth * 0.3,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            widget.experience.explain!,
                            style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: cardSize * 0.6 * 0.1),
                          ),
                        ],
                      ),
                    )
                  : Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              20.0), // Apply border radius to the image
                          child: Image.asset(
                            widget.experience.photo!,
                            width: cardSize,
                            height: cardSize * 1.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: cardSize * 0.2,
                            decoration: BoxDecoration(
                              color: kyellow,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                widget.experience.name!,
                                style: GoogleFonts.raleway(
                                  fontSize: cardSize *
                                      0.08, // Adjust font size as needed
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
