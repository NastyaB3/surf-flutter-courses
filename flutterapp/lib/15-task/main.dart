import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/15-task/cubit/ball_cubit.dart';
import 'package:flutterapp/15-task/data/repository/repository.dart';
import 'package:flutterapp/15-task/screens/ball_screen.dart';
import 'package:flutterapp/15-task/utils/custom_colors.dart';

final dio = Dio();
const baseUrl = 'https://eightballapi.com/api';

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
        create: (BuildContext context) => BallRepository(
          dio: dio,
          baseUrl: baseUrl,
        ),
        child: BlocProvider(
          create: (context) => BallCubit(context.read<BallRepository>()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Magic Ball',
            theme: ThemeData(
              textTheme: const TextTheme(
                titleMedium: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.colorGray,
                ),
                titleLarge: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            home: const BallScreen(),
          ),
        ),
      ),
    );
  }
}
