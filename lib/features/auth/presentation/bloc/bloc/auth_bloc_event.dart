part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent {}

class SignupEvent extends AuthBlocEvent {
  SignupRequestModel signupRequestModel;
  SignupEvent(this.signupRequestModel);
}
