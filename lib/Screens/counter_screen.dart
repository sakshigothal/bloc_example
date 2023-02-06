import 'package:bloc_example/Blocs/counterBloc/counter_bloc.dart';
import 'package:bloc_example/Blocs/counterBloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('updated Counter Value'),
                    BlocBuilder<CounterBloc, CounterState>(
                      builder: (context, state) {
                        return Text(state.counter.toString());
                      },
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: () async{
                    context.read<CounterBloc>().add(IncrementCounter());
                  }, child: const Icon(Icons.add),),
                  FloatingActionButton(onPressed: () async{
                    context.read<CounterBloc>().add(DecrementCounter());
                    // CounterBloc().add(DecrementCounter());
                  }, child: const Icon(Icons.remove),),

                  FloatingActionButton(onPressed: () async{
                    context.read<CounterBloc>().add(DecrementCounterByHighValue());
                    // CounterBloc().add(DecrementCounter());
                  }, child: const Icon(Icons.remove_circle_outline),),
                  FloatingActionButton(onPressed: () async{
                    context.read<CounterBloc>().add(IncrementCounterByHighValue());
                    // CounterBloc().add(DecrementCounter());
                  }, child: const Icon(Icons.add_box_rounded),)
                ],
              ),
            );
          }
      ),
    );
  }
}
