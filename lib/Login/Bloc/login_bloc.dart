import 'dart:async';
import 'package:bloc/bloc.dart';
import '../API provider/login_provider.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginInitial loginInitial) : super(LoginInitial()) {
    on(eventHandler);
  }

  FutureOr<void> eventHandler(LoginEvent event, Emitter<LoginState> emit) async{
    final apiProvider = ApiProvider();
    await apiProvider.loginUser().then((value) => emit(LoginSuccess(value)));
  }
}


