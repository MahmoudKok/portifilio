import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:sizer/sizer.dart';

class MobileAboutMe extends StatelessWidget {
  const MobileAboutMe({
    super.key,
    required this.screenWidth,
    required this.isWideScreen,
    required this.aboutMe,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;
  final bool isWideScreen;
  final String aboutMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (screenWidth <= 637 && screenWidth >= 550)
          ? screenHeight * 2.5
          : ((screenWidth <= 550 && screenWidth >= 470)
              ? screenHeight * 2.2
              : ((screenWidth <= 470 && screenWidth >= 350)
                  ? screenHeight * 1.9
                  : (screenWidth < 300
                      ? screenHeight * 1.4
                      : screenHeight * 1.6))),
      padding: EdgeInsets.symmetric(
        horizontal: 2.w,
        vertical: 1.h,
      ),
      decoration: BoxDecoration(
        color: kcomponentBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 2.w, right: 4.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'About Me',
              style: GoogleFonts.changa(
                color: darkWihte,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: screenWidth,
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/about_me.png'),
                    SizedBox(
                      width: 20.w,
                    ),
                    Image.asset('assets/images/about_me2.png'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  aboutMe,
                  style: GoogleFonts.changa(
                    color: darkWihte,
                    fontSize: 9.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'MAHM',
                  style: GoogleFonts.greatVibes(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
