import 'package:flutter/material.dart';
import 'package:desafio_sprint_3/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: searchScreen(),
    );
  }
}
