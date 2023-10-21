import 'package:flutter/material.dart';

class MedalWidget extends StatelessWidget {
  const MedalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double fontSize = 32;
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '🥇',
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          '🥇',
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          '🥉',
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          '🥈',
          style: TextStyle(fontSize: fontSize),
        ),
        Text(
          '🥉',
          style: TextStyle(fontSize: fontSize),
        ),
      ],
    );
  }
}
