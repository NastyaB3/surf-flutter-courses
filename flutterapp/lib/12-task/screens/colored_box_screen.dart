import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/12-task/widget/colored_box_body.dart';
import 'package:flutterapp/12-task/cubit/colored_box_cubit.dart';
import 'package:flutterapp/12-task/data/repository/repository_colored_box.dart';

class ColoredBoxScreen extends StatefulWidget {
  const ColoredBoxScreen({super.key});

  @override
  State<ColoredBoxScreen> createState() => _ColoredBoxScreenState();
}

class _ColoredBoxScreenState extends State<ColoredBoxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 44),
                Text(
                  'Эксклюзивная палитра',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text('«Colored Box»',
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (BuildContext context) {
          return ColoredBoxCubit(
            context.read<ColoredBoxRepository>(),
          );
        },
        child: const ColoredBoxBody(),
      ),
    );
  }
}
