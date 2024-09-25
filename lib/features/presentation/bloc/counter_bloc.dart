import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_couter_bloc/features/domain/usecases/counter_usecase.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterUseCaseImpl _counterUseCase;

  CounterBloc(this._counterUseCase) : super(CounterInitialState(0)) {
    on<IncrementEvent>((event, emit) {
      // Check if the state is either CounterInitialState or CounterUpdatedState
      final currentState = state;
      int currentCount = 0;

      if (currentState is CounterInitialState) {
        currentCount = currentState.count;
      } else if (currentState is CounterUpdatedState) {
        currentCount = currentState.count;
      }

      final newCount = _counterUseCase.executeIncrement(currentCount);
      emit(CounterUpdatedState(newCount));
    });

    on<DecrementEvent>((event, emit) {
      final currentState = state;
      int currentCount = 0;

      if (currentState is CounterInitialState) {
        currentCount = currentState.count;
      } else if (currentState is CounterUpdatedState) {
        currentCount = currentState.count;
      }

      final newCount = _counterUseCase.executeDecrement(currentCount);
      emit(CounterUpdatedState(newCount));
    });
  }
}
