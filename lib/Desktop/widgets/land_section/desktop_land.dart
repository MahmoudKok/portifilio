import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/constants.dart';
import '../../../helpers/responsive.dart';
import 'land_section_widgets.dart';

class DesktopLand extends StatefulWidget {
  DesktopLand({super.key, this.screenHeight, this.screenWidth});
  late double? screenWidth;
  late double? screenHeight;
  final String cvLink =
      'https://drive.google.com/file/d/1hH7_YvQd_vszsJn8YEK4gmLFN4QA5n75/view';

  final String landDescribe = '''
Welcome! I'm Mahmoud Kokeh, a Flutter developer and data scientist passionate about creating remarkable apps and extracting insights from data.
🚀 Flutter Developer:
Crafting dynamic apps with Flutter to provide seamless user experiences across platforms.
📊 Data Science Enthusiast:
Exploring data to uncover meaningful insights and drive informed decisions.
Thank you for visiting my portfolio!
                  ''';

  late AnimationController _controller;

  @override
  State<DesktopLand> createState() => _DesktopLandState();
}

class _DesktopLandState extends State<DesktopLand>
    with TickerProviderStateMixin {
  bool isAnimating = false;
  bool isButtonPressed = false;

  late Animation<Alignment> _alignmentAnimation;
  late AnimationController _controller;
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _alignmentAnimation = AlignmentTween(
      begin: const Alignment(-0.4, 0.4),
      end: Alignment.bottomLeft, // Adjust this value for the desired spacing
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
          setState(() {
            isButtonPressed = false;
          });
        }
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !isButtonPressed) {
        _controller.reverse();
      }
    });
  }

  void startAnimation() {
    _controller.forward().then((_) {
      if (!isButtonPressed) {
        _controller.reverse();
      }
    });
  }

  void stopAnimation() {
    if (isButtonPressed) {
      _controller.reverse();
    }
  }

  void _toggleAnimation() {
    setState(() {
      isButtonPressed = !isButtonPressed;
    });

    if (isButtonPressed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widget.screenWidth!;
    double screenHeight = widget.screenHeight!;

    return Container(
      width: screenWidth,
      height: screenHeight * 1.75,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.001,
      ),
      decoration: const BoxDecoration(
        color: kcomponentBackground,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Stack(
        fit: StackFit.loose,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.8),
            child: RandomCirclesWithLines(
              isDesktop: true,
              containerWidth: screenWidth,
              containerHeight: screenHeight,
              numberOfCircles: 50,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 0,
                      child: Text(
                        "Hi, I'm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Mahmoud",
                              style: GoogleFonts.nunito(
                                letterSpacing: screenWidth * 0.005,
                                color: ktail3,
                                fontSize: screenWidth * 0.08,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " Kokeh",
                              style: GoogleFonts.nunito(
                                letterSpacing: screenWidth * 0.005,
                                color: kyellow,
                                fontSize: screenWidth * 0.08,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0,
                      child: AnimatedTextWidget(
                          label: 'Flutter developer',
                          style: GoogleFonts.anton(
                            color: darkWihte,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Expanded(
                      flex: 0,
                      child: AnimatedTextWidget(
                          label: 'Data Scientist',
                          style: GoogleFonts.anton(
                            color: darkWihte,
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: screenWidth * 0.4,
                      child: Text(
                        widget.landDescribe,
                        maxLines: 10,
                        style: TextStyle(
                            color: darkWihte,
                            fontSize: screenWidth * 0.015,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 20),
                    /*NeumorPhosimButton(
                      hi: screenHeight * 0.095,
                      wi: screenWidth * 0.12,
                      label: 'Download CV',
                    )*/
                    GestureDetector(
                      onTap: () async {
                        print('Hello');
                        setState(() {
                          isButtonPressed = true;
                        });
                      },
                      onTapDown: (_) {
                        setState(() {
                          isButtonPressed = true;
                          isAnimating = true;
                        });
                        startAnimation();
                      },
                      onTapUp: (_) {
                        setState(() {
                          isButtonPressed = false;
                          isAnimating = true;
                        });
                        stopAnimation();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: screenHeight * 1.1 * 0.095,
                            width: screenWidth * 0.12,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: screenHeight * 1.1 * 0.08,
                                    width: screenWidth * 0.105,
                                    decoration: BoxDecoration(
                                      color: kpink,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                AlignTransition(
                                  alignment: _alignmentAnimation,
                                  child: MaterialButton(
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () async {
                                      setState(() {
                                        isButtonPressed = !isButtonPressed;
                                      });
                                      if (await canLaunchUrl(
                                          Uri.parse(widget.cvLink))) {
                                        print('Yes it is');
                                        await launchUrl(
                                            Uri.parse(widget.cvLink));
                                      } else {
                                        print('Holly cow nothing is happening');
                                      }
                                      if (isButtonPressed) {
                                        _controller.forward();
                                      } else {
                                        _controller.reverse();
                                      }
                                    },
                                    child: Container(
                                      height: screenHeight * 1.1 * 0.08,
                                      width: screenWidth * 0.105,
                                      decoration: BoxDecoration(
                                        color: kyellow,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Download CV',
                                          style: TextStyle(
                                            color: kpurble,
                                            fontSize: screenWidth * 0.015,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          MaterialButton(
                            onPressed: () async {
                              if (await canLaunchUrl(
                                  Uri.parse('https://t.me/Mahmoud_kok'))) {
                                print('Yes it is');
                                await launchUrl(
                                    Uri.parse('https://t.me/Mahmoud_kok'));
                              } else {
                                print('Holly cow nothing is happening');
                              }
                            },
                            hoverColor: kdarkpurble,
                            child: Container(
                              width: screenWidth * 0.15,
                              height: screenHeight * 1.8 * 0.055,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: kpurble,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Contact',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.01,
                                    ),
                                    Icon(
                                      Icons.call,
                                      color: white,
                                      size: screenWidth * 0.02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                    Expanded(
                      flex: 0,
                      child: Container(

                          // height: screenHeight * 0.3,
                          // width: screenWidth,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Text(
                                    'Linkedin',
                                    style: GoogleFonts.anton(
                                      color: kyellow,
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '+1400 followers',
                                    style: GoogleFonts.anton(
                                      color: kpink,
                                      fontSize: screenWidth * 0.02,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ])),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Text(
                                    'GitHub',
                                    style: GoogleFonts.anton(
                                      color: kyellow,
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '+8 Projects',
                                    style: GoogleFonts.anton(
                                      color: kpink,
                                      fontSize: screenWidth * 0.02,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ])),
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  Text(
                                    'Experince',
                                    style: GoogleFonts.anton(
                                      color: kyellow,
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    '+2 Years',
                                    style: GoogleFonts.anton(
                                      color: kpink,
                                      fontSize: screenWidth * 0.02,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ]))
                          ])),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    "assets/images/land_screen.png", // Replace with your image asset path

                    height: screenHeight,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
