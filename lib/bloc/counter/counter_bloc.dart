import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juncook_example/bloc/counter/counter_event.dart';
import 'package:juncook_example/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(count: 0, text: "")) {
    // truyền event vào
    // emit phát ra evnet -->
    on<IncreaseEvent>((event, emit) => _increaseEvent(event, emit));
    on<DecreaseEvent>((event, emit) => _decreaseEvent(emit));
  }

  _increaseEvent(IncreaseEvent event, Emitter emit) {
    emit(CounterState(count: state.count + event.amount, text: "Tuyen cộng"));
  }

  _decreaseEvent(Emitter emit) {
    emit(CounterState(count: state.count - 1, text: "Tuyen trừ"));
  }
}
