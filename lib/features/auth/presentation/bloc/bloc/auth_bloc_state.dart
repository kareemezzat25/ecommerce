part of 'auth_bloc_bloc.dart';

enum RequestState { init, loading, success, error }

class AuthBlocState {
  RequestState? signupRequestState;
  AuthModel? authModel;
  Failures? failures;

  AuthBlocState(
      {this.signupRequestState = RequestState.init,
      this.authModel,
      this.failures});

  AuthBlocState copyWith(
      {RequestState? signupRequestState,
      AuthModel? authModel,
      Failures? failures}) {
    return AuthBlocState(
        signupRequestState: signupRequestState ?? this.signupRequestState,
        authModel: authModel ?? this.authModel,
        failures: failures ?? this.failures);
  }
}

final class AuthBlocInitial extends AuthBlocState {}
