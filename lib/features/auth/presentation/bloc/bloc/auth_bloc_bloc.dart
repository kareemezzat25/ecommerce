import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/signin_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/signup_usecase.dart';
import 'package:injectable/injectable.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

@injectable
class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  SignupUsecase signupUsecase;
  SigninUsecase signinUsecase;
  AuthBlocBloc(this.signupUsecase, this.signinUsecase)
      : super(AuthBlocInitial()) {
    on<AuthBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignupEvent>((event, emit) async {
      emit(state.copyWith(signupRequestState: RequestState.loading));
      var result = await signupUsecase.call(event.signupRequestModel);
      result.fold((l) {
        print("succes");
        emit(state.copyWith(
            signupRequestState: RequestState.success, authModel: l));
      }, (r) {
        print("Error ");
        emit(state.copyWith(
            signupRequestState: RequestState.error, failures: r));
      });
    });
    on<SigninEvent>((event, emit) async {
      emit(state.copyWith(signInRequestState: RequestState.loading));
      var result = await signinUsecase.call(
          email: event.email, password: event.password);
      result.fold((l) {
        emit(state.copyWith(signInRequestState: RequestState.success));
      }, (r) {
        emit(state.copyWith(signInRequestState: RequestState.error));
      });
    });
  }
}
