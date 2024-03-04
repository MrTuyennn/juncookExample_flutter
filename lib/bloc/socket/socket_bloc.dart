import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juncook_example/bloc/socket/socket_event.dart';
import 'package:juncook_example/bloc/socket/socket_state.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  late final WebSocketChannel _socket;

  SocketBloc() : super(const SocketState()) {
    on<WebSocketConnect>(_webSocketConnect);

    on<WebSocketSendMessage>(_wedSocketSendData);

    on<WebSocketDisconnect>(_webSocketDisConnect);
  }

  _webSocketConnect(WebSocketConnect event, Emitter emit) {
    _socket = WebSocketChannel.connect(
      Uri.parse('wss://echo.websocket.events'),
    );
    _socket.stream.listen(
      (data) {
        // check data when socket is connected
        // add(WebSocketConnect(data));
        print(data);
      },
      // check data when socket is DisConnected
      onDone: () => print('done'),
      // check data when socket is Error
      onError: (error) => print('error $error'),
    );
  }

  _wedSocketSendData(WebSocketSendMessage event, Emitter emit) {}
  _webSocketDisConnect(WebSocketDisconnect event, Emitter emit) {}
}
