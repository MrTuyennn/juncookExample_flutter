import 'package:flutter/material.dart';
import 'package:juncook_example/floating-hearts/provider/floating-hearts-provider.dart';
import 'package:provider/provider.dart';

class FloatingHeartsWidget extends StatelessWidget {
  const FloatingHeartsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    FloatingHeartsProvider floatingHeartsProvider =
        context.watch<FloatingHeartsProvider>();
    Size size = MediaQuery.of(context).size;

    return Container(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          height: size.height * 0.8,
          width: size.width * 0.2,
          child: Stack(children: floatingHeartsProvider.hearts),
        ),
      ),
    ));
  }
}
