import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_couter_bloc/features/domain/entities/counter_entity.dart';
import 'package:simple_couter_bloc/features/domain/usecases/counter_usecase.dart';
import 'package:simple_couter_bloc/features/presentation/bloc/counter_bloc.dart';
import 'package:simple_couter_bloc/features/presentation/pages/counter_page.dart';

void main() {
  // Initialize the CounterEntity first
  final counterEntity =
      CounterEntity(count: 0); // Set the initial value of the counter to 0

  // Pass the CounterEntity to the CounterUseCaseImpl
  final counterUseCase = CounterUseCaseImpl(counterEntity);

  runApp(MyApp(counterUseCase));
}

class MyApp extends StatelessWidget {
  final CounterUseCaseImpl counterUseCase;

  const MyApp(this.counterUseCase, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(counterUseCase),
        child: CounterPage(),
      ),
    );
  }
}
