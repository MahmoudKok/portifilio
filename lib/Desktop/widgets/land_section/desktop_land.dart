import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/constants.dart';
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
  @override
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
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
            child: RandomCirclesWithLines(
              isDesktop: true,
              containerWidth: screenWidth,
              containerHeight: screenHeight,
              numberOfCircles: 10,
            ),
          ),
          FittedBox(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, I'm",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    FittedBox(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Mahmoud",
                              style: GoogleFonts.nunito(
                                letterSpacing: 1.w,
                                color: ktail3,
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " Kokeh",
                              style: GoogleFonts.nunito(
                                letterSpacing: 1.w,
                                color: kyellow,
                                fontSize: 35.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedTextWidget(
                        label: 'Flutter developer',
                        style: GoogleFonts.anton(
                          color: darkWihte,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w500,
                        )),
                    AnimatedTextWidget(
                        label: 'Data Scientist',
                        style: GoogleFonts.anton(
                          color: darkWihte,
                          fontSize: 35.sp,
                          fontWeight: FontWeight.w500,
                        )),
                    SizedBox(height: 2.h),
                    SizedBox(
                      width: 120.w,
                      child: Text(
                        widget.landDescribe,
                        maxLines: 15,
                        style: TextStyle(
                            color: darkWihte,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(height: 3.h),
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
                            height: 35.sp,
                            width: 35.w,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 28.sp,
                                    width: 33.w,
                                    decoration: BoxDecoration(
                                      color: kpink,
                                      borderRadius: BorderRadius.circular(5.sp),
                                    ),
                                  ),
                                ),
                                AlignTransition(
                                  alignment: _alignmentAnimation,
                                  child: MaterialButton(
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
                                      height: 28.sp,
                                      width: 33.w,
                                      decoration: BoxDecoration(
                                        color: kyellow,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Download CV',
                                          style: TextStyle(
                                            color: kpurble,
                                            fontSize: 12.sp,
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
                          SizedBox(width: 2.w),
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
                              height: 28.sp,
                              width: 33.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: kpurble,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Contact',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Icon(
                                    Icons.call,
                                    color: white,
                                    size: 12.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    FittedBox(
                      child: Row(children: [
                        SizedBox(
                          width: 2.w,
                        ),
                        FittedBox(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Linkedin',
                                  style: GoogleFonts.anton(
                                    color: kyellow,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  '+1500 followers',
                                  style: GoogleFonts.anton(
                                    color: kpink,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        FittedBox(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'GitHub',
                                  style: GoogleFonts.anton(
                                    color: kyellow,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  '+8 Projects',
                                  style: GoogleFonts.anton(
                                    color: kpink,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        FittedBox(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Experince',
                                  style: GoogleFonts.anton(
                                    color: kyellow,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  '+2 Years',
                                  style: GoogleFonts.anton(
                                    color: kpink,
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ]),
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 500.sp,
                  width: 400.sp,
                  child: FittedBox(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          "assets/images/land_screen.png", // Replace with your image asset path
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
