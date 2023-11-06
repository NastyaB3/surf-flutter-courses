import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/12-task/data/repository/repository_colored_box.dart';
import 'package:flutterapp/14-task/postogram_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context)=> ColoredBoxRepository(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Postogram',
        home: PostogramScreen(),
      ),
    );
  }
}

