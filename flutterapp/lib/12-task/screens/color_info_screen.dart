import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/12-task/widget/decoration_container.dart';
import 'package:flutterapp/12-task/widget/convert_color.dart';
import 'package:flutterapp/12-task/widget/snackBar_widget.dart';

class ColorInfoScreen extends StatelessWidget {
  final String name;
  final Color colorValue;
  final String colorName;

  const ColorInfoScreen({
    super.key,
    required this.name,
    required this.colorValue,
    required this.colorName,
  });

  @override
  Widget build(BuildContext context) {
    String rgbColor = getRgbColor(colorName);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorValue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: colorName,
              child: Container(
                height: 318,
                width: double.infinity,
                color: colorValue,
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 16),
                  DecorationContainer(
                    colorName: 'Hex',
                    colorHex: colorName.replaceAll('#', ''),
                    onTap: () {
                      snackBarWidget(
                        context,
                        data: colorName,
                        text: 'Hex скопирован',
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DecorationContainer(
                          colorName: 'Red',
                          rgbColor: rgbColor,
                          onTap: () {
                            snackBarWidget(
                              context,
                              data: colorName,
                              text: 'Цвет скопирован',
                            );
                          }),
                      const SizedBox(width: 17),
                      DecorationContainer(
                        colorName: 'Green',
                        rgbColor: rgbColor,
                        onTap: () {
                          snackBarWidget(
                            context,
                            data: colorName,
                            text: 'Цвет скопирован',
                          );
                        },
                      ),
                      const SizedBox(width: 17),
                      DecorationContainer(
                        colorName: 'Blue',
                        rgbColor: rgbColor,
                        onTap: () {
                          snackBarWidget(
                            context,
                            data: colorName,
                            text: 'Цвет скопирован',
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
