import 'package:bloc/bloc.dart';
import 'package:bloc_example/Blocs/counterBloc/counter_state.dart';
import 'package:equatable/equatable.dart';
part 'counter_event.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCounter>(_incrementCounterEvent);

    on<DecrementCounter>(_decrementCounterEvent);

    on<IncrementCounterByHighValue>(_incrementCounterByHighValue);

    on<DecrementCounterByHighValue>(_decrementCounterByHighValue);
  }

  void _incrementCounterEvent(IncrementCounter event,Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter + 1));
  }

  void _decrementCounterEvent(DecrementCounter event,Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter - 1));
  }

  void _incrementCounterByHighValue(IncrementCounterByHighValue event,Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter + 100));
  }

  void _decrementCounterByHighValue(DecrementCounterByHighValue event,Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter - 100));
  }
}
