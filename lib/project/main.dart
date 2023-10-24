import 'package:flutter/material.dart';
import 'part1_1.dart';
import 'title.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: title(),
    );
  }
}