import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../API provider/login_provider.dart';
import '../Bloc/login_bloc.dart';
import '../Bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final repository = ApiProvider();
  LoginBloc loginBloc = LoginBloc(LoginInitial());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(),
          const SizedBox(height: 20),
          TextFormField(),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: ()async{
            await repository.getListingResponse();
            // loginBloc.add(LoginButtonPressed(username: 'manager@gmail.com',password: '123456'));
          },
              child: const Text('Login')),


          BlocConsumer(
            bloc: loginBloc,
              builder: (context,state){
              if(state is LoginSuccess){
              return Text('success');
            }
              return SizedBox();

          }, listener: (context,state){
              if(state is LoginSuccess){
                if(state.response is HttpResponse){
                  Map<String,dynamic> map = state.response;
                  if(map['success'] == true){
                    debugPrint('success true');
                  }else{
                    debugPrint('success false');
                  }
                }
              }else{
                debugPrint('is not login success state');
              }
          })
        ],
      ),
    );
  }
}
