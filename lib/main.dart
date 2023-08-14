import 'package:flutter/material.dart';
import 'package:waffer/components/intro.dart';
import 'package:waffer/keyboard_action.dart';
import 'package:waffer/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreenDefault(),
    );
  }
}
