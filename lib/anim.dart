import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Animated extends StatefulWidget {
  const Animated({super.key});

  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> with TickerProviderStateMixin {
  late final animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
  late final curvedAnimation = CurvedAnimation(parent: animationController, curve: Curves.elasticOut);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // AnimatedContainer(
          //   duration: Duration(milliseconds: 300),
          //   height: Random().nextInt(300) + 100,
          //   width: Random().nextInt(300) + 100,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(Random().nextInt(40) + 5),
          //     color: getRandomColor(),
          //   ),
          // ),
          RotationTransition(
            turns: animationController,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  animationController.reverse(from: 0.45);
                },
                child: FlutterLogo(size: 150.0),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                animationController.forward(from: 0);
              },
              child: Text("Oka")),
          ElevatedButton(
              onPressed: () {
                animationController.stop();
              },
              child: Text("stiop")),
          AnimatedRotation(
            turns: Random().nextInt(2).toDouble(),
            duration: Duration(milliseconds: 500),
            child: Text("Dipak Bhai".toCemalCase),
          ),
          Container(
            height: 500,
            width: 500,
            child: TweenAnimationBuilder<int>(
              tween: IntTween(begin: 0, end: 24),
              duration: Duration(seconds: 1),
              child: Row(
                children: [
                  Expanded(child: Icon(Icons.linear_scale, size: 100)),
                  Expanded(child: Icon(Icons.arrow_right_alt, size: 100)),
                ],
              ),
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value / 12 * pi,
                  child: child,
                );
              },
            ),
          ),
          Lottie.network('https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }

  Color getRandomColor() {
    var r = Random().nextInt(255) + 1;
    var g = Random().nextInt(255) + 1;
    var b = Random().nextInt(255) + 1;
    return Color.fromARGB(255, r, g, b);
  }
}

extension MyString on String {
  String get toCemalCase {
    String str = this;
    str = str.toLowerCase();
    var split = str.split(" ");
    return split
        .map((element) {
          var indexOf = element.substring(0, 1);
          return element.replaceRange(0, 1, indexOf.toUpperCase());
        })
        .toList()
        .join(" ");
  }
}
