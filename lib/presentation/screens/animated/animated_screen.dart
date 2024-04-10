import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';

class AnimdatedScreen extends StatefulWidget {
  static const name = 'animated_screen';
  
  const AnimdatedScreen({super.key});

  @override
  State<AnimdatedScreen> createState() => _AnimdatedScreenState();
}

class _AnimdatedScreenState extends State<AnimdatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double borderRadius = 10.5;
  late Timer timer;
  bool stop = true;

  void changeShape(){
    final random = Random();
    width = random.nextInt(350) + 120;
    height = random.nextInt(550) + 120;
    borderRadius = random.nextInt(150) + 20;
    color = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1
    );
    setState(() {});
  }

  void automaticChange() => timer = Timer.periodic(
    const Duration(seconds: 1),
    (timer){
      changeShape();
    }
  );

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.elasticOut,
          width: width <= 0 ? 0 : width,
          height:  height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius)
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          stop = !stop;
          setState(() {
            if(stop)
              timer.cancel();          
            else
              automaticChange();          
          });
        },
        child: stop ? const Icon(Icons.play_arrow_rounded) : const Icon(Icons.pause),
      ),
    );
  }
}