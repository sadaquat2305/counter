abstract class CounterState {}

class CounterInitialState extends CounterState {
  final int count;
  CounterInitialState(this.count);
}

class CounterUpdatedState extends CounterState {
  final int count;
  CounterUpdatedState(this.count);
}
