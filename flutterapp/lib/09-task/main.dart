import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnimationContainerPage(title: 'Animation Container Demo'),
    );
  }
}

class AnimationContainerPage extends StatefulWidget {
  const AnimationContainerPage({super.key, required this.title});

  final String title;

  @override
  State<AnimationContainerPage> createState() => _AnimationContainerPageState();
}

class _AnimationContainerPageState extends State<AnimationContainerPage>
    with TickerProviderStateMixin {
  Color color = Colors.purple;
  bool selected = false;
  late AnimationController controller;
  late Animation<double> animation;
  late double _deltaX = MediaQuery.of(context).size.width / 2 - 100;
  late double _deltaY = MediaQuery.of(context).size.height / 2 - 200;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _startRotationAnimation() {
    controller.forward(from: 0.0);
  }

  void _stopRotationAnimation() {
    controller.stop();
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    setState(() {
      _deltaX += details.delta.dx;
      _deltaY += details.delta.dy;
    });
  }

  void _onTap() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _deltaX,
            top: _deltaY,
            child: RotationTransition(
              turns: animation,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                height: 200,
                width: 200,
                color: selected ? Colors.purple : Colors.amber,
              ),
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTap,
              onLongPress: () {
                setState(() {
                  selected = !selected;
                });
                if (selected) {
                  _startRotationAnimation();
                } else {
                  _stopRotationAnimation();
                }
              },
              onVerticalDragUpdate: _handleDragUpdate,
              onHorizontalDragUpdate: _handleDragUpdate,
            ),
          ),
        ],
      ),
    );
  }
}
