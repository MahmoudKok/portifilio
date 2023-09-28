import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../models/projectsModel.dart';

class MyProjectsScreen extends StatefulWidget {
  const MyProjectsScreen({super.key});

  @override
  _MyProjectsScreenState createState() => _MyProjectsScreenState();
}

class _MyProjectsScreenState extends State<MyProjectsScreen> {
  List<ProjectModel> projects = [
    ProjectModel(
      photo: 'assets/images/projects/flutter/SchoolMate.jpg',
      name: 'School Mate',
      projectType: 'Flutter app',
      link:
          'https://www.linkedin.com/posts/mahmoud-kokeh-20a155214_flutter-getx-firebase-activity-6965403006699757569-YZMz?utm_source=share&utm_medium=member_desktop',
      icon: Icons.phone_iphone_outlined,
      explain:
          'Is a project to mange schools in profisonal way and keep students, teachers , parents and school in touch!\n The app diveded in rolls to give free experment to anyone use the app\n students can do all thier school activties online! and teachers do thie jop with more help\n the app has an admin panel to controll everything in one place',
    ),
    ProjectModel(
      photo: 'assets/images/projects/flutter/cheap_shop.jpg',
      projectType: 'Flutter app',
      name: 'Cheap Shop',
      link: 'https://github.com/MahmoudKok/Cheap-shop',
      icon: Icons.phone_iphone_outlined,
      explain:
          'E-commerce market built to buy and sell the proudcts whose about to expire\nhas a lot of features like search on product , search by category, and even contact with customers and seller with comments on proudct!',
    ),
    ProjectModel(
      photo: 'assets/images/projects/ml/SketchY.jpg',
      projectType: 'ML project',
      link:
          'https://www.linkedin.com/posts/mahmoud-kokeh-20a155214_machinelearning-neuralnetworks-knn-activity-7101122564650856449-xHPY?utm_source=share&utm_medium=member_desktop',
      name: 'SketchY',
      icon: Icons.model_training,
      explain:
          'a dynamic web application designed to foster the artistic talents of children aged 5 to 12. Parents and teachers who are looking for innovative educational tools to develop children\'s skills are also part of the intended user base.',
    ),
    ProjectModel(
      photo: 'assets/images/projects/ml/heart_beat_ml.jpg',
      projectType: 'ML project',
      link: 'https://github.com/MahmoudKok/Heartbeat_Categorization',
      name: 'Heartbeat Categorization',
      icon: Icons.model_training,
      explain:
          'This project is aimed at developing a machine learning model that can accurately classifyheartbeats aseither normal or abnormal. The model is trained on a dataset of ECG (electrocardiogram) signals,whichwere collected from patients and labeled by medical professionals.',
    ),
    ProjectModel(
      photo: 'assets/images/projects/ml/diamonds_ml.jpg',
      projectType: 'ML project',
      link: 'https://github.com/MahmoudKok/Diamonds_price_prediction',
      name: 'Diamonds price prediction',
      icon: Icons.model_training,
      explain:
          'This project aims to predict the price of a diamond ring based on its entered characteristics',
    ),
    ProjectModel(
      photo: 'assets/images/projects/ml/music_ml.jpg',
      projectType: 'ML project',
      link: 'https://github.com/MahmoudKok/music_genere_classification',
      name: 'music genere classification',
      icon: Icons.model_training,
      explain:
          'This project aims to predict the class of the songs based on the features we consider in our data',
    ),
  ];

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Responsive res = Responsive();
    bool isWideScreen = res.isDesktop(context);
    return Container(
      decoration: BoxDecoration(
        color: kcomponentBackground, // Choose your color
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "My Projects",
            style: headlabel(isWideScreen),
          ),
          const SizedBox(height: 20.0),
          AutoScrollRow(
            children: projects.map((project) {
              return Row(
                children: [
                  ProjectItem(
                    screenWidth: screenWidth,
                    project: project,
                  ),
                  SizedBox(
                      width: screenWidth *
                          0.05), // Add spacing between items (adjust as needed)
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class ProjectItem extends StatefulWidget {
  final double screenWidth;
  final ProjectModel project;

  const ProjectItem(
      {super.key, required this.screenWidth, required this.project});

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    double cardSize = widget.screenWidth * 0.3;
    double labelWidth = cardSize * 0.2;

    return MouseRegion(
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
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.project.link!))) {
            print('Yes it is');
            await launchUrl(Uri.parse(widget.project.link!));
          } else {
            print('Holly cow nothing is happening');
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isHovered ? cardSize * 1.1 : cardSize,
          height: isHovered ? cardSize * 1.4 : cardSize * 1.3,
          decoration: BoxDecoration(
            color: isHovered ? konhoverpurble : kdarkpurble,
            borderRadius: BorderRadius.circular(10.sp),
            border: isHovered
                ? Border.all(color: konhoverpurble, width: 2.0)
                : null,
          ),
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isHovered
                  ? Padding(
                      padding: EdgeInsets.all(cardSize * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              widget.project.name!,
                              style: TextStyle(
                                fontSize: labelWidth * 0.8,
                                fontWeight: FontWeight.bold,
                                color: kyellow,
                              ),
                            ),
                          ),
                          SizedBox(height: cardSize * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.project.projectType!,
                                style: TextStyle(
                                    fontSize: labelWidth * 0.45,
                                    color: white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: labelWidth * 0.1,
                              ),
                              Icon(
                                widget.project.icon!,
                                color: white,
                                size: labelWidth * 0.5,
                              )
                            ],
                          ),
                          SizedBox(height: cardSize * 0.02),
                          Text(
                            widget.project.explain!,
                            style: TextStyle(
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(cardSize * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: cardSize * 1.4 * 0.6,
                            width: cardSize,
                            decoration: BoxDecoration(
                              color: kyellow,
                              borderRadius: BorderRadius.circular(10.sp),
                              image: DecorationImage(
                                image: AssetImage(widget.project.photo!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: cardSize * 0.02),
                          Text(
                            widget.project.name!,
                            style: TextStyle(
                              fontSize: labelWidth * 0.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: cardSize * 0.01),
                          Text(
                            widget.project.projectType!,
                            style: TextStyle(
                              fontSize: labelWidth * 0.3,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )),
        ),
      ),
    );
  }
}

class AutoScrollRow extends StatefulWidget {
  final List<Widget> children;

  const AutoScrollRow({super.key, required this.children});

  @override
  _AutoScrollRowState createState() => _AutoScrollRowState();
}

class _AutoScrollRowState extends State<AutoScrollRow> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;
  bool _isScrolling = true;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  // Automatically scroll the row to the right
  void _startAutoScroll() {
    Timer.periodic(const Duration(milliseconds: 8), (timer) {
      if (_scrollController.hasClients && _isScrolling) {
        _scrollPosition += 2.0; // Adjust the speed of scrolling here
        if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
          _scrollPosition = _scrollController.position.minScrollExtent;
        }
        _scrollController.jumpTo(_scrollPosition);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isScrolling = false;
        });
      },
      onExit: (_) {
        setState(() {
          _isScrolling = true;
        });
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        child: Row(
          children: widget.children,
        ),
      ),
    );
  }
}
