import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingTextWidget extends StatelessWidget {
  ///Var
  String txt;

  ///const
  HeadingTextWidget({this.txt});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '${txt}',
          style: GoogleFonts.lateef(
            textStyle: TextStyle(
              fontSize: 30.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
