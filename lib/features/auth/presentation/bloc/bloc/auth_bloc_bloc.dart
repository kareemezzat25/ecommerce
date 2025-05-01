import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  SignupUsecase signupUsecase;
  AuthBlocBloc(this.signupUsecase) : super(AuthBlocInitial()) {
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
  }
}
