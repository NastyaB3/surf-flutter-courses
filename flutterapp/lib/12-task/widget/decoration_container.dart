import 'package:flutter/material.dart';

class DecorationContainer extends StatelessWidget {
  final String? rgbColor;
  final String colorName;
  final String? colorHex;
  final VoidCallback? onTap;

  const DecorationContainer({
    super.key,
    this.rgbColor,
    required this.colorName,
    this.colorHex,
    this.onTap,
  });

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            colorName,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: onTap,
            child: Text(
              rgbColor != null
                  ? rgbColor!.split(',')[1]
                  : colorHex != null
                      ? colorHex!
                      : '',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
