import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedGradientScreen extends StatefulWidget {
  const AnimatedGradientScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedGradientScreen> createState() => _AnimatedGradientScreenState();
}

class _AnimatedGradientScreenState extends State<AnimatedGradientScreen> {
  List<List<Color>> colorLists = [
    [const Color(0xffF8EAD7), const Color(0xffFAFEFF)],
    [const Color(0xffFAFEFF), const Color(0xffF8EAD7)],
  ];
  int index = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        index = (index + 1) % colorLists.length;
      });
    });
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return  AnimatedContainer(
      duration: const Duration(seconds: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: colorLists[index],
        ),
      ),
    );
  }
}
