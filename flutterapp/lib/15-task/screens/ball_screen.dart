import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/15-task/cubit/ball_cubit.dart';
import 'package:flutterapp/15-task/screens/background_widget.dart';
import 'package:flutterapp/15-task/utils/custom_colors.dart';
import 'package:flutterapp/15-task/utils/loader.dart';
import 'package:shake/shake.dart';
import '../utils/images.dart';

class BallScreen extends StatefulWidget {
  const BallScreen({super.key});

  @override
  State<BallScreen> createState() => _BallScreenState();
}

class _BallScreenState extends State<BallScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  );
  late final AnimationController _secondController;

  late final Animation<double> _animationSecond;
  late ShakeDetector detector;

  @override
  void initState() {
    _secondController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..forward();
    _animationSecond = CurvedAnimation(
      parent: _secondController,
      curve: Curves.easeIn,
    );
    detector = ShakeDetector.waitForStart(
      onPhoneShake: () async {
        await context.read<BallCubit>().getAnswer();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<BallCubit, BallState>(
          builder: (context, state) {
            return BackgroundWidget(
              child: switch (state) {
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
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Positioned.fill(
                          child: FadeTransition(
                            opacity: _animationSecond,
                            child: InkWell(
                              child: Image.asset(
                                Images.backgroundImage,
                                fit: BoxFit.fitWidth,
                              ),
                              onTap: () async {
                                _secondController
                                    .addStatusListener((status) async {
                                  if (status == AnimationStatus.dismissed) {
                                    await context.read<BallCubit>().getAnswer();
                                  }
                                });
                                _secondController.reverse();
                              },
                            ),
                          ),
                        ),
                        Text(
                          'Нажмите на шар \nили потрясите телефон',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                BallSuccess() => Center(
                    child: FadeTransition(
                      opacity: _animation,
                      child: Text(
                        state.result.reading,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                BallError() => Text(
                    'Error. Try again',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.red,
                    ),
                  ),
                BallLoading() => const Center(
                    child: LoaderWidget(),
                  ),
              },
            );
          },
        ),
      ),
    );
  }
}
