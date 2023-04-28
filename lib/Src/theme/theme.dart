import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_application_5/Src/theme/palette.dart';

class LMStheme{
  LMStheme._();
  static ThemeData lightTheme=ThemeData(
    primarySwatch: Palette.appBrown,
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline1: GoogleFonts.roboto(
        color: Colors.black38,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        height: 1,
      ),
      headline2: GoogleFonts.roboto(
        color: Colors.black38,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1,
      ),
      headline3: GoogleFonts.roboto(
        color: Colors.black38,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      headline4: GoogleFonts.roboto(
        color: Colors.black38,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1,
      )
    )
  );

  static ThemeData darkTheme=ThemeData(


  );

}

