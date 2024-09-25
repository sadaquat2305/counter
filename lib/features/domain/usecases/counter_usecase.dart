import 'package:simple_couter_bloc/features/domain/entities/counter_entity.dart';

class CounterUseCaseImpl {
  final CounterEntity _counter;

  // Initialize the CounterEntity in the constructor
  CounterUseCaseImpl(this._counter);

  int executeIncrement(int currentCount) {
    _counter.increment(); // Safely increment the counter
    return _counter.count;
  }

  int executeDecrement(int currentCount) {
    _counter.decreament(); // Safely decrement the counter
    return _counter.count;
  }
}
