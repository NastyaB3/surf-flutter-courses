import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/16-task/cubit/set_checkbox_cubit.dart';
import 'package:flutterapp/16-task/cubit/set_pet_cubit.dart';
import 'package:flutterapp/16-task/screens/registration_screen.dart';
import 'package:flutterapp/16-task/utils/custom_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SetPetCubit(),
        ),
        BlocProvider(
          create: (context) => SetCheckboxCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Validation form',
        theme: appTheme,
        home: const RegistrationScreen(),
      ),
    );
  }
}
