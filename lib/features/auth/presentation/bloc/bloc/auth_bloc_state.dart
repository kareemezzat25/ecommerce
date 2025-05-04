part of 'auth_bloc_bloc.dart';

enum RequestState { init, loading, success, error }

class AuthBlocState {
  RequestState? signupRequestState;
  RequestState? signInRequestState;
  AuthModel? authModel;
  Failures? failures;

  AuthBlocState(
      {this.signupRequestState,
      this.signInRequestState,
      this.authModel,
      this.failures});

  AuthBlocState copyWith(
      {RequestState? signupRequestState,
      RequestState? signInRequestState,
      AuthModel? authModel,
      Failures? failures}) {
    return AuthBlocState(
        signupRequestState: signupRequestState ?? this.signupRequestState,
        signInRequestState: signInRequestState ?? this.signInRequestState,
        authModel: authModel ?? this.authModel,
        failures: failures ?? this.failures);
  }
}

final class AuthBlocInitial extends AuthBlocState {
  AuthBlocInitial()
      : super(
            signInRequestState: RequestState.init,
            signupRequestState: RequestState.init);
}
