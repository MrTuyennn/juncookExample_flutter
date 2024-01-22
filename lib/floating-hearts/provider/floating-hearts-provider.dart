import 'package:flutter/material.dart';
import 'package:juncook_example/floating-hearts/widgets/heart.dart';

class FloatingHeartsProvider with ChangeNotifier {
  FloatingHeartsProvider();

  final List<Widget> _hearts = <Widget>[];
  int _key = 0;

  List<Widget> get hearts => _hearts;

  void addHeart() {
    _hearts.add(Heart(key: Key(_key.toString())));
    _key++;
    notifyListeners();
  }

  void removeHeart(Key? key) {
    _hearts.removeWhere((heart) => heart.key == key);
  }
}
