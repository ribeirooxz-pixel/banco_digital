import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
        scaffoldBackgroundColor: const Color(0xFFF5F6FA), // Fundo acinzentado premium
        primaryColor: const Color(0xFF820AD1), // Roxo principal
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF820AD1)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}