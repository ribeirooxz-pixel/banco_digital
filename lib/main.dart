import 'package:flutter/material.dart';
import 'package:banco_digital/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banco Digital',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        primaryColor: const Color(0xFF820AD1),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF820AD1)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}