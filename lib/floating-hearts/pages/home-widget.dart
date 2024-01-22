import 'dart:async';

import 'package:flutter/material.dart';
import 'package:juncook_example/floating-hearts/provider/floating-hearts-provider.dart';
import 'package:juncook_example/floating-hearts/widgets/floating-hearts.dart';
import 'package:juncook_example/floating-hearts/widgets/heart-button.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Timer _timer;

  @override
  void initState() {
    // runs every 1 second
    Timer.periodic(const Duration(seconds: 1), (timer) {
      FloatingHeartsProvider floatingHeartsProvider =
          context.read<FloatingHeartsProvider>();
      floatingHeartsProvider.addHeart();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Hearts'),
      ),
      body: Scaffold(
        body: Stack(children: [
          const Center(child: Text('Floating hearts')),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.1,
              bottom:
                  MediaQuery.of(context).viewInsets.bottom + size.height * 0.1,
              child: const FloatingHeartsWidget()),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.05,
            bottom:
                MediaQuery.of(context).viewInsets.bottom + size.height * 0.1,
            child: const HeartButton(),
          ),
        ]),
      ),
    );
  }
}
