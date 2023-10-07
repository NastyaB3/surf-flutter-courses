import 'package:flutter/material.dart';

class DecorationContainer extends StatelessWidget {
  final Widget? child;

  const DecorationContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: child,
    );
  }
}
