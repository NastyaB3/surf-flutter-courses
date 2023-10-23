import 'package:flutter/material.dart';
import 'package:flutterapp/14-task/photo_info_screen.dart';
import 'package:flutterapp/14-task/utils/images.dart';

class PostogramScreen extends StatefulWidget {
  const PostogramScreen({super.key});

  @override
  State<PostogramScreen> createState() => _PostogramScreenState();
}

class _PostogramScreenState extends State<PostogramScreen> {
  List<String> images = [
    Images.photo_1,
    Images.photo_2,
    Images.photo_3,
    Images.photo_4,
    Images.photo_5,
    Images.photo_6,
    Images.photo_7,
    Images.photo_8,
    Images.photo_9,
    Images.photo_10,
    Images.photo_11,
    Images.photo_12,
    Images.photo_13,
    Images.photo_14,
    Images.photo_15,
    Images.photo_16,
    Images.photo_17,
    Images.photo_18,
    Images.photo_19,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: SafeArea(child: Image.asset(Images.logo)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 3,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoInfoScreen(
                    image: images[index],
                    index: index,
                    imageCount: images.length,
                  ),
                ),
              );
            },
            child: Image.asset(
              images[index],
              width: 116,
              height: 116,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
