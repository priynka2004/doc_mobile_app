part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class FirstTimeLoginEvent extends UserEvent{

  final UserModel user;

  FirstTimeLoginEvent({required this.user});


}
