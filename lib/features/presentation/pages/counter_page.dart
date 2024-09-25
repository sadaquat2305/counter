// presentation/counter_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_couter_bloc/features/presentation/bloc/counter_bloc.dart';
import 'package:simple_couter_bloc/features/presentation/bloc/counter_event.dart';
import 'package:simple_couter_bloc/features/presentation/bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("building");
    return Scaffold(
      appBar: AppBar(title: Text("Counter App")),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          int count = (state is CounterUpdatedState) ? state.count : 0;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Count: $count"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        print("Decrement");
                        context.read<CounterBloc>().add(DecrementEvent());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        print("Increment");
                        context.read<CounterBloc>().add(IncrementEvent());
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
