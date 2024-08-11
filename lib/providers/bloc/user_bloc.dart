import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:healtether_clinic_app/models/user_model/user_model.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

 UserModel?  user;

 UserModel get getUser=>user!;

  UserBloc() : super(UserInitial()) {
   on<FirstTimeLoginEvent>(firstTimeLoginEvent);
  }

  FutureOr<void> firstTimeLoginEvent(FirstTimeLoginEvent event, Emitter<UserState> emit) {
   
     
  }
}
