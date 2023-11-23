import 'package:flutter/material.dart';
import '../utils/images.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Images.backgroundSuccessImage,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}
