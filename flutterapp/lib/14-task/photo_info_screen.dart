import 'package:flutter/material.dart';
import 'package:flutterapp/14-task/utils/styles.dart';

class PhotoInfoScreen extends StatefulWidget {
  final String image;
  final int index;
  final int imageCount;

  const PhotoInfoScreen({
    super.key,
    required this.image,
    required this.index,
    required this.imageCount,
  });

  @override
  State<PhotoInfoScreen> createState() => _PhotoInfoScreenState();
}

class _PhotoInfoScreenState extends State<PhotoInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              children: [
                Text(
                  (widget.index + 1).toString(),
                  style: Styles.countText,
                ),
                Text(
                  '/${widget.imageCount}',
                  style: Styles.imageLengthText,
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(widget.image),
      ),
    );
  }
}
