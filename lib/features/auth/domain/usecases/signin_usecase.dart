import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUsecase {
  AuthRepo authRepo;
  SigninUsecase(this.authRepo);

  Future<Either<AuthModel, Failures>> call(
      {required String email, required String password}) {
    return authRepo.signIn(email: email, password: password);
  }
}
