import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/15-task/cubit/ball_cubit.dart';
import 'package:flutterapp/15-task/data/repository/repository.dart';
import 'package:flutterapp/15-task/utils/custom_colors.dart';
import 'package:flutterapp/15-task/utils/styles.dart';

import '../utils/images.dart';

class BallScreen extends StatefulWidget {
  const BallScreen({super.key});

  @override
  State<BallScreen> createState() => _BallScreenState();
}

class _BallScreenState extends State<BallScreen> {
  @override
  Widget build(BuildContext context) {
    final repository = context.read<BallRepository>();

    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<BallCubit, BallState>(
          builder: (context, state) {
            return switch (state) {
              BallInitial() => Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomColors.colorBackground,
                        CustomColors.colorBackgroundSecond,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          child: Image.asset(Images.backgroundImage),
                          onTap: () async {
                            await context.read<BallCubit>().getAnswer();
                          },
                        ),
                        Text(
                          'Нажмите на шар \nили потрясите телефон',
                          style: Styles.text,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              BallSuccess() => Stack(children: [
                  Positioned.fill(
                      child: Image.asset(
                    Images.backgroundSuccessImage,
                    fit: BoxFit.cover,
                  )),
                  Center(
                    child: Text(
                      state.result.reading,
                      style: Styles.header,
                      textAlign: TextAlign.center,
                    ),
                  )
                ]),
              BallError() => Text(
                  'Error. Try again',
                  style: Styles.header.copyWith(
                    color: Colors.red,
                  ),
                ),
              BallLoading() => Stack(
                  children: [
                    Positioned.fill(
                        child: Image.asset(
                      Images.backgroundSuccessImage,
                      fit: BoxFit.cover,
                    )),
                    const Center(child: CircularProgressIndicator()),
                  ],
                ),
            };
          },
        ),
      ),
    );
  }
}
