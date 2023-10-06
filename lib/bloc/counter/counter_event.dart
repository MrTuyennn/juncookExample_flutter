abstract class CounterEvent {}

class IncreaseEvent extends CounterEvent {
  final int amount;
  IncreaseEvent(this.amount);
}

class DecreaseEvent extends CounterEvent {
  final int amount;
  DecreaseEvent(this.amount);
}
