import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

const kdarkgrey = Color.fromARGB(255, 58, 58, 58);

const kbackground = Color(0xff222222);
const kcomponentBackground = Color(0xff161515);
const darkgrey2 = Color(0xff414141);
const darkgrey1 = Color(0xff828282);

const darkWihte = Color(0xffE4E4E4);

const ktail1 = Color(0xFF044343);
const ktail2 = Color(0xFF045757);
const ktail3 = Color.fromARGB(255, 19, 177, 177);
const ktail4 = Color(0xFF37e2d5);

const kyellow = Color(0xffFBCB0A);
const kpurble = Color(0xff590696);
const kdarkpurble = Color.fromARGB(255, 59, 48, 68);
const konhoverpurble = Color.fromARGB(255, 114, 85, 137);
const kpink = Color(0xffC70A80);
const kpink2 = Color.fromARGB(255, 238, 185, 218);
const white = Colors.white;

Text headSection(String label) {
  return Text(
    label,
    style: GoogleFonts.changa(
        color: darkWihte, fontSize: 10, fontWeight: FontWeight.normal),
  );
}

TextStyle headlabel(isWideScreen) {
  return GoogleFonts.changa(
    color: darkWihte,
    fontSize: isWideScreen ? 36.sp : 30.sp,
    fontWeight: FontWeight.bold,
  );
}
