import 'package:flutter/widgets.dart';

class Responsive {
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  bool isMobile(BuildContext context) {
    return screenWidth(context) < 768; // Adjust this threshold as needed
  }

  bool isTablet(BuildContext context) {
    return screenWidth(context) >= 768 && screenWidth(context) < 1024;
  }

  bool isDesktop(BuildContext context) {
    return screenWidth(context) >= 1024;
  }
}
