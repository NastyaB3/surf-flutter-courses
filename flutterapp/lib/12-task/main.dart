import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/12-task/screens/colored_box_screen.dart';
import 'package:flutterapp/12-task/data/repository/repository_colored_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context)=> ColoredBoxRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Colored Box',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            primary: const Color(0xFF252838),
            seedColor: const Color(0xFF252838),
          ),
          textTheme: const TextTheme(
            bodySmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            labelLarge: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          useMaterial3: true,
          fontFamily: 'Ubuntu',
        ),
        home: const ColoredBoxScreen(),
      ),
    );
  }
}
