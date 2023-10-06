import 'package:equatable/equatable.dart';

class CounterState extends Equatable {
  const CounterState({this.count = 0, this.text = ""});

  final int count;
  final String text;

  @override
  List<Object?> get props => [count, text];
}
