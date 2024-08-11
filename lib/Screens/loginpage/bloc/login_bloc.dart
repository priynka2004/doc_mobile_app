import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:healtether_clinic_app/services/auth/auth_services.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {

    on<LogingProcessEvent>(logingProcessEvent);
    on<LoginRestartEvent>(loginRestartEvent);
    
  }

  FutureOr<void> logingProcessEvent(LogingProcessEvent event, Emitter<LoginState> emit)async {

  emit(LoginProcessState());
  print("login started");
 String result = await AuthService.loginUser(event.number,event.password,event.context);
print(result);
 if(result=="Login Success"){
  emit(LoginSuccessfulState());
 }


 else {

  emit(LoginFailState(error: result));
 }

  
  
  
  }

  FutureOr<void> loginRestartEvent(LoginRestartEvent event, Emitter<LoginState> emit) {

    emit(LoginInitial());
  }
}
