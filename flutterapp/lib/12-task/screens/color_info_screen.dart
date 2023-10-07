import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/12-task/widget/decoration_container.dart';

class ColorInfoScreen extends StatelessWidget {
  final String name;
  final Color colorValue;
  final String colorName;

  const ColorInfoScreen(
      {super.key,
      required this.name,
      required this.colorValue,
      required this.colorName});

  @override
  Widget build(BuildContext context) {
    String rgbColor = hexToColor(colorName);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorValue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 318,
            width: double.infinity,
            color: colorValue,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hex',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      InkWell(
                        onTap: () async {
                          Clipboard.setData(ClipboardData(text: colorName))
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Hex скопирован")));
                          });
                        },
                        child: Text(
                          colorName.replaceAll('#', ''),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    DecorationContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Red',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            rgbColor.split(',')[0],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 17),
                    DecorationContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Green',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 16),
                          Text(
                            rgbColor.split(',')[1],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 17),
                    DecorationContainer(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Blue',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            rgbColor.split(',')[2],
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String hexToColor(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    int intValue = int.parse(hexColor, radix: 16);
    int red = (intValue >> 16) & 0xFF;
    int green = (intValue >> 8) & 0xFF;
    int blue = intValue & 0xFF;
    return '$red, $green, $blue';
  }
}
