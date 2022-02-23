import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoinRatesWidget extends StatelessWidget {
  ///Vars
  String txtCode;
  String txtPrice;
  final Size s;

  ///const
  CoinRatesWidget({
    this.txtCode,
    this.txtPrice,
    this.s,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: s.width,
        child: Center(
          child: Row(
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
                '${txtPrice}',
                style: GoogleFonts.lateef(
                  textStyle: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
