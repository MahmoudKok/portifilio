import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/Desktop/widgets/land_section/land_section_widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/constants.dart';

class TabletLand extends StatefulWidget {
  TabletLand({super.key, this.screenHeight, this.screenWidth});
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
  State<TabletLand> createState() => _TabletLandState();
}

class _TabletLandState extends State<TabletLand> with TickerProviderStateMixin {
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
    var careerTextSizeMob = screenWidth * 0.12;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        color: kcomponentBackground,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RandomCirclesWithLines(
            isDesktop: false,
            containerWidth: screenWidth,
            containerHeight: screenHeight * 2 * 0.2,
            numberOfCircles: 10,
          ),
          FittedBox(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hi, I'm",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                FittedBox(
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Mahmoud",
                          style: GoogleFonts.nunito(
                            letterSpacing: 2.sp,
                            color: ktail3,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " Kokeh",
                          style: GoogleFonts.nunito(
                            letterSpacing: 2.sp,
                            color: kyellow,
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                /*Text("Flutter Developer",
                          style: GoogleFonts.anton(
                            color: darkWihte,
                            fontSize: screenWidth * 0.12,
                            fontWeight: FontWeight.w500,
                          )),*/
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
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                        height: 10.h,
                        width: 40.w,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                height: 8.h,
                                width: 38.w,
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
                                  height: 8.h,
                                  width: 38.w,
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
                    ),
                    SizedBox(width: 6.w),
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
                        height: 10.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
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
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 5.sp,
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
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                SizedBox(
                    child: FittedBox(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Linkedin',
                                  style: GoogleFonts.anton(
                                    color: kyellow,
                                    fontSize: screenWidth * 0.08,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  '+1500 followers',
                                  style: GoogleFonts.anton(
                                    color: kpink,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          width: screenWidth * 0.1,
                        ),
                        FittedBox(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'GitHub',
                                  style: GoogleFonts.anton(
                                    color: kyellow,
                                    fontSize: screenWidth * 0.08,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  '+8 Projects',
                                  style: GoogleFonts.anton(
                                    color: kpink,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ]),
                        ),
                        SizedBox(
                          width: screenWidth * 0.1,
                        ),
                        FittedBox(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Experince',
                                  style: GoogleFonts.anton(
                                    color: kyellow,
                                    fontSize: screenWidth * 0.07,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Text(
                                  '+2 Years',
                                  style: GoogleFonts.anton(
                                    color: kpink,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ]),
                        )
                      ]),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
