import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../models/experinceModel.dart';

class MyExperincesScreen extends StatefulWidget {
  const MyExperincesScreen({super.key});

  @override
  State<MyExperincesScreen> createState() => _MyExperincesScreenState();
}

class _MyExperincesScreenState extends State<MyExperincesScreen> {
  final ScrollController _scrollController = ScrollController();

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
          SizedBox(
            width: 60.w,
            child: FittedBox(
              child: Text(
                "My Experinces",
                maxLines: 1,
                style: headlabel(isWideScreen),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection:
                      Axis.horizontal, // Allow horizontal scrolling
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
                ),
              ),
              Visibility(
                visible: res.isDesktop(context),
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scrollController.animateTo(
                            _scrollController.offset - screenWidth * 0.2,
                            duration: const Duration(milliseconds: 100),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          width: 15.sp,
                          height: 15.sp,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: kdarkpurble,
                                    blurRadius: 5,
                                    spreadRadius: 5)
                              ],
                              color: kdarkpurble.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _scrollController.animateTo(
                            _scrollController.offset + screenWidth * 0.2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          width: 15.sp,
                          height: 15.sp,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: kdarkpurble,
                                    blurRadius: 5,
                                    spreadRadius: 5)
                              ],
                              color: kdarkpurble.withOpacity(0.1),
                              shape: BoxShape.circle),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
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
      {super.key,
      required this.screenWidth,
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
    double cardSize = widget.screenWidth * 0.5;
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
          height: cardSize * 0.8,
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
                      child: FittedBox(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.experience.name!,
                              style: GoogleFonts.raleway(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                                color: kyellow,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            SizedBox(
                              width: 60.w,
                              child: Text(
                                widget.experience.explain!,
                                softWrap: true,
                                style: GoogleFonts.raleway(
                                    color: Colors.white, fontSize: 10.sp),
                              ),
                            ),
                          ],
                        ),
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

class HorizontalScrollWithButtons extends StatefulWidget {
  const HorizontalScrollWithButtons({super.key});

  @override
  _HorizontalScrollWithButtonsState createState() =>
      _HorizontalScrollWithButtonsState();
}

class _HorizontalScrollWithButtonsState
    extends State<HorizontalScrollWithButtons> {
  final ScrollController _scrollController = ScrollController();

  // Define the amount of scroll when buttons are pressed.
  final double scrollAmount = 100.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.offset - scrollAmount,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text('Scroll Left'),
            ),
            ElevatedButton(
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.offset + scrollAmount,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Text('Scroll Right'),
            ),
          ],
        ),
        SizedBox(
          height: 200, // Set the height of the horizontal scrollable row
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            children: <Widget>[
              // Your horizontally scrollable content goes here
              Container(
                width: 300, // Set the width of each item as needed
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Item 1',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 300,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Item 2',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 300,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    'Item 3',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              // Add more items as needed
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
