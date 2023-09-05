// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portifilio/helpers/constants.dart';
import 'package:portifilio/helpers/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingSection extends StatefulWidget {
  late AnimationController _controller;
  final String cvLink =
      'https://drive.google.com/file/d/1hH7_YvQd_vszsJn8YEK4gmLFN4QA5n75/view';

  LandingSection({super.key});

  @override
  State<LandingSection> createState() => _LandingSectionState();
}

class _LandingSectionState extends State<LandingSection>
    with TickerProviderStateMixin {
  bool isButtonPressed = false;
  bool isAnimating = false;
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

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
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Responsive res = Responsive();
    bool isWideScreen = res.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: isWideScreen ? 80 : 40,
      ),
      decoration: BoxDecoration(
        color: kcomponentBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: isWideScreen ? 3 : 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi, I'm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Mahmoud",
                        style: GoogleFonts.nunito(
                          letterSpacing: screenWidth * 0.005,
                          color: ktail3,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " Kokeh",
                        style: GoogleFonts.nunito(
                          letterSpacing: screenWidth * 0.005,
                          color: kyellow,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Flutter Developer",
                    style: GoogleFonts.anton(
                      color: darkWihte,
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w500,
                    )),
                Text(
                  "Data Science",
                  style: GoogleFonts.anton(
                    color: darkWihte,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: isWideScreen ? screenWidth * 0.4 : double.infinity,
                  child: Text(
                    '''
    Welcome! I'm Mahmoud Kokeh, a Flutter developer and data scientist passionate about creating remarkable apps and extracting insights from data.
    🚀 Flutter Developer:
    Crafting dynamic apps with Flutter to provide seamless user experiences across platforms.
    📊 Data Science Enthusiast:
    Exploring data to uncover meaningful insights and drive informed decisions.
    Thank you for visiting my portfolio!
                  ''',
                    maxLines: 10,
                    style: TextStyle(
                        color: darkWihte,
                        fontSize: screenWidth * 0.01,
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
                  child: SizedBox(
                    height: screenHeight * 0.095,
                    width: screenWidth * 0.12,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: screenHeight * 0.08,
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
                                await launchUrl(Uri.parse(widget.cvLink));
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
                              height: screenHeight * 0.08,
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
                ),
              ],
            ),
          ),
          Expanded(
            flex: isWideScreen ? 3 : 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 20 : 0),
              child: Image.asset(
                "assets/images/land_screen.png", // Replace with your image asset path

                height: screenHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*

https://drive.google.com/file/d/1hH7_YvQd_vszsJn8YEK4gmLFN4QA5n75/view?usp=drive_link
*/

//signikaNegative