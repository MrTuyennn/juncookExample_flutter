import 'package:flutter/material.dart';

class ScreenSocket extends StatefulWidget {
  const ScreenSocket({super.key});

  @override
  State<ScreenSocket> createState() => _ScreenSocketState();
}

class _ScreenSocketState extends State<ScreenSocket> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text("Socket"),
      ),
    );
  }
}
