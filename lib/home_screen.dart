import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  ///final id
  static final id = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Home Screen'),
    ));
  }
}