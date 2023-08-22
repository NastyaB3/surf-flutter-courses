import 'package:flutter/material.dart';
import 'package:flutterapp/10-task/utils/strings.dart';
import 'package:flutterapp/10-task/utils/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Handjet',
      ),
      home: const CardPage(),
    );
  }
}

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Images.emoji1,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
              Image.asset(
                Images.emoji2,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
              Image.asset(
                Images.emoji3,
                fit: BoxFit.cover,
                height: 50,
                width: 50,
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(18.0),
            child: Image.asset(
              Images.myImage,
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ),
          Center(
            child: Text(
              Strings.name,
              style: Styles.header,
            ),
          ),
          Center(
            child: Text(
              Strings.profession,
              style: Styles.subtitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Strings.intro,
              style: Styles.text,
            ),
          ),
        ],
      ),
    );
  }
}
