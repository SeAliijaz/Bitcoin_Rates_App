import 'package:bitcoin_rates_api/BitCoin_WorkSpace/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) {
        return MaterialApp(
          ///title of App
          title: 'Bitcoin-Rates',

          ///DebugShowCheckedModeBanner
          debugShowCheckedModeBanner: false,

          ///home
          home: HomeScreen(),
        );
      }),
    );
  }
}
