import 'package:flutter/material.dart';

class CounterScreenUsingCubit extends StatelessWidget {
  const CounterScreenUsingCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          FloatingActionButton(onPressed: (){},child: const Icon(Icons.add),),
          FloatingActionButton(onPressed: (){},child: const Icon(Icons.remove),)
        ],
      ),
      body: const Center(
        child: Text('0'),
      ),
    );
  }
}
