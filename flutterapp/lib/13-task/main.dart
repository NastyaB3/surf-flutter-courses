import 'package:flutter/material.dart';
import 'package:flutterapp/13-task/screen/profile_screen.dart';
import 'package:flutterapp/13-task/theme/theme.dart';

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
      theme: createLightTheme(),
      home: const ProfileScreen(),
    );
  }
}
