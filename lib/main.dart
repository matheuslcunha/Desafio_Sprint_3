import 'package:flutter/material.dart';
import 'package:desafio_sprint_3/views/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: searchScreen(),
    );
  }
}
