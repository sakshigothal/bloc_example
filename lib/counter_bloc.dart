import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/counter_event.dart';
import 'package:bloc_example/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc(super.initialState);

  /*int _counter = 0;
  final _counterStateController = StreamController<int>();
  StreamSink<int> get _intCounter => _counterStateController.sink;
  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event){
    if(event is IncrementEvent){
      _counter++;
    }else{
      _counter--;
    }
    _intCounter.add(_counter);
  }

  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }*/

  CounterState get initialState => CounterState.initial();

  Stream<CounterState> mapEventToState(CounterState currentState, CounterEvent event)async*{


  }
}