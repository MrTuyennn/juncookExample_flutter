import 'package:equatable/equatable.dart';

class SocketEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class WebSocketConnect extends SocketEvent {
  final Map<String, dynamic> json;
  WebSocketConnect(this.json);
}

class WebSocketSendMessage extends SocketEvent {
  WebSocketSendMessage();
}

class WebSocketDisconnect extends SocketEvent {}
