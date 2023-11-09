import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/15-task/cubit/ball_cubit.dart';
import 'package:flutterapp/15-task/data/repository/repository.dart';
import 'package:flutterapp/15-task/screens/ball_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BallCubit(context.read<BallRepository>()),
      child: RepositoryProvider(
        create: (BuildContext context) => BallRepository(),
        child: BlocProvider(
          create: (context) => BallCubit(context.read<BallRepository>()),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Magic Ball',
            home: BallScreen(),
          ),
        ),
      ),
    );
  }
}
