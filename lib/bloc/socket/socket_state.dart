import 'package:equatable/equatable.dart';

class SocketState extends Equatable {
  const SocketState({this.count = 0, this.text = ""});

  final int count;
  final String text;

  @override
  List<Object?> get props => [count, text];
}
