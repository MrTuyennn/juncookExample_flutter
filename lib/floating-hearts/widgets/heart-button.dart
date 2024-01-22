import 'package:flutter/material.dart';
import 'package:juncook_example/floating-hearts/provider/floating-hearts-provider.dart';
import 'package:provider/provider.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return RawMaterialButton(
      onPressed: () {
        FloatingHeartsProvider floatingHeartsProvider =
            context.read<FloatingHeartsProvider>();
        floatingHeartsProvider.addHeart();
      },
      elevation: 2.0,
      shape: const CircleBorder(),
      child: Icon(
        Icons.favorite_border_outlined,
        color: Colors.white,
        size: size.width * 0.1,
      ),
    );
  }
}
