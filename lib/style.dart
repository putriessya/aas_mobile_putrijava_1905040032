import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color colorPrimary = const Color(0xff1E232C);
Color greenColor = Color.fromARGB(255, 204, 254, 182);
Color blackColor = const Color(0xff000000);
Color whiteColor = const Color(0xffFFFFFF);
Color greyColor = const Color(0xff82868E);
Color green2Color = Color.fromARGB(255, 103, 241, 91);

const double edge = 24;
TextStyle blackTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
  color: greyColor,
);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: colorPrimary,
);

TextStyle regularTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: colorPrimary,
);
