import 'package:flutter/material.dart';
import 'package:flutterapp/14-task/photo_info_screen.dart';
import 'package:flutterapp/14-task/utils/images.dart';

class PostogramScreen extends StatelessWidget {
  const PostogramScreen({super.key});

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
        itemCount: Images.photos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoInfoScreen(
                    images:  Images.photos,
                    index: index,
                  ),
                ),
              );
            },
            child: Hero(
              tag:  Images.photos[index],
              child: Image.asset(
                Images.photos[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
