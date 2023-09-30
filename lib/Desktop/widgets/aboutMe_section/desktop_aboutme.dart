import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portifilio/helpers/constants.dart';
import 'package:sizer/sizer.dart';

class DesktopAboutMe extends StatelessWidget {
  const DesktopAboutMe({
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
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  'About Me',
                  style: GoogleFonts.changa(
                    color: darkWihte,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/about_me.png'),
                          SizedBox(
                            height: 100.h,
                          ),
                          Image.asset('assets/images/about_me2.png'),
                        ],
                      ),
                    ),
                    SizedBox(width: 6.w),
                    FittedBox(
                      child: SizedBox(
                        width: screenWidth,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: Text(
                                aboutMe,
                                style: GoogleFonts.changa(
                                  color: darkWihte,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Text(
                              'MAHM',
                              style: GoogleFonts.greatVibes(
                                  color: Colors.white,
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
