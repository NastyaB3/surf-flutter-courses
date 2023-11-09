import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutterapp/14-task/utils/ccolors.dart';

class PhotoInfoScreen extends StatefulWidget {
  final List<String> images;
  final int index;


  const PhotoInfoScreen({
    super.key,
    required this.images,
    required this.index,

  });

  @override
  State<PhotoInfoScreen> createState() => _PhotoInfoScreenState();
}

class _PhotoInfoScreenState extends State<PhotoInfoScreen> {
  late int currentPhoto;
  late final _pageController = PageController(
    initialPage: widget.index,
    viewportFraction: 0.8,
  );

  @override
  void initState() {
    currentPhoto = widget.index;
    _pageController.addListener(_onNumberChanged);
    super.initState();
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onNumberChanged)
      ..dispose();
    super.dispose();
  }

  void _onNumberChanged() {
    setState(() {
      currentPhoto = _pageController.page!.round();
    });
  }

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
                  (currentPhoto + 1).toString(),
                  style: Theme.of(context).textTheme.titleMedium!,
                ),
                Text(
                  '/${widget.images.length}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: CColors.greyText,
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: currentPhoto == index ? 1 : 0.9,
              child: SizedBox(
                height: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Visibility(
                        visible: currentPhoto + 1 > index,
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(color: Colors.transparent),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Hero(
                          tag: widget.images[index],
                          child: Image.asset(
                            widget.images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        controller: _pageController,
        itemCount: widget.images.length,
      ),
    );
  }
}
