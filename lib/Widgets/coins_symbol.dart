import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinsSymbolWidget extends StatelessWidget {
  ///Vars
  String txtCode;
  String txtSymbol;

  ///const
  CoinsSymbolWidget({
    this.txtCode,
    this.txtSymbol,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '${txtCode}',
          style: GoogleFonts.lateef(
            textStyle: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
        Text(
          '${txtSymbol}',
          style: GoogleFonts.lateef(
            textStyle: TextStyle(
              fontSize: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
