// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/Desktop/widgets/land_section/desktop_land.dart';
import 'package:portifilio/Desktop/widgets/land_section/mobile_land.dart';
import 'package:portifilio/Desktop/widgets/land_section/tablet_land.dart';

import 'package:portifilio/helpers/constants.dart';
import 'package:portifilio/helpers/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/land_section/land_section_widgets.dart';

// ignore: must_be_immutable
class LandingSection extends StatefulWidget {
  LandingSection({super.key});

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
  late AnimationController _controllerMob;

  @override
  State<LandingSection> createState() => _LandingSectionState();
}

class _LandingSectionState extends State<LandingSection>
    with TickerProviderStateMixin {
  bool isAnimating = false;
  bool isButtonPressed = false;

  late Animation<Alignment> _alignmentAnimation;
  late Animation<Alignment> _alignmentAnimationMob;
  late AnimationController _controller;
  late AnimationController _controllerMob;

  @override
  void dispose() {
    _controller.dispose();
    _controllerMob.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controllerMob = AnimationController(
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
    _alignmentAnimationMob = AlignmentTween(
      begin: const Alignment(0, 0.4),
      end: Alignment.bottomLeft, // Adjust this value for the desired spacing
    ).animate(_controllerMob)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllerMob.reverse();
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
    _controllerMob.addStatusListener((status) {
      if (status == AnimationStatus.completed && !isButtonPressed) {
        _controllerMob.reverse();
      }
    });
  }

  void startAnimation() {
    _controller.forward().then((_) {
      if (!isButtonPressed) {
        _controller.reverse();
      }
    });
    _controllerMob.forward().then((_) {
      if (!isButtonPressed) {
        _controller.reverse();
      }
    });
  }

  void stopAnimation() {
    if (isButtonPressed) {
      _controller.reverse();
      _controllerMob.reverse();
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Responsive res = Responsive();
    bool isWideScreen = res.isDesktop(context);
    bool isTablet = res.isTablet(context);
    bool isMobile = res.isMobile(context);
    var careerTextSizeMob = screenWidth * 0.12;
    /********************************************************************************************************
        ************************************************************************************************************
        ********************************************************************************************************
        ***********************************************Desktop*********************************************************
        ********************************************************************************************************
        ***************************************************************************************************************
        ********************************************************************************************************
        */
    return isWideScreen
        ? DesktopLand(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          )
        /********************************************************************************************************
        ************************************************************************************************************
        ********************************************************************************************************
        ***********************************************MOBILE*********************************************************
        ********************************************************************************************************
        ***************************************************************************************************************
        ********************************************************************************************************
        */
        : (isMobile
            ? MobileLand(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              )
            /********************************************************************************************************
        ************************************************************************************************************
        ********************************************************************************************************
        ***********************************************Tablet*********************************************************
        ********************************************************************************************************
        ***************************************************************************************************************
        ********************************************************************************************************
        */
            : TabletLand(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ));
  }
}

/*
signikaNegative
https://drive.google.com/file/d/1hH7_YvQd_vszsJn8YEK4gmLFN4QA5n75/view?usp=drive_link
*/
