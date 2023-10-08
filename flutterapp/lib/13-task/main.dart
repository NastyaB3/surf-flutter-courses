import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/screen/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          secondary: const Color(0xFF252849),
          primaryContainer: const Color(0xFF60607B),
          secondaryContainer: const Color(0xFFF1F1F1),
          tertiary: const Color(0xFFB5B5B5),
          error: const Color(0xFFFF0000),
          onPrimary: const Color(0xFF67CD00),

        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        useMaterial3: true,
        fontFamily: 'Sf Pro Display',
      ),
      home: const ProfileScreen(),
    );
  }
}
