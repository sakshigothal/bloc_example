

import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{}

class LoginError extends LoginState{}

class LoginSuccess extends LoginState{
  final dynamic response;
  const LoginSuccess(this.response);
}
