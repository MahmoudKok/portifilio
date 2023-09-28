import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:sizer/sizer.dart';

class TabletAboutMe extends StatelessWidget {
  const TabletAboutMe({
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Image.asset('assets/images/about_me.png'),
                      SizedBox(
                        height: 20.h,
                      ),
                      Image.asset('assets/images/about_me2.png'),
                    ],
                  ),
                ),
                SizedBox(width: 6.w),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        aboutMe,
                        style: GoogleFonts.changa(
                          color: darkWihte,
                          fontSize: isWideScreen ? 18 : 16,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'MAHM',
                        style: GoogleFonts.greatVibes(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
