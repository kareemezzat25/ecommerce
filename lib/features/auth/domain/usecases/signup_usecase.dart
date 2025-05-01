import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/data/models/authmodel.dart';
import 'package:ecommerce_app/features/auth/data/models/signuprequestmodel.dart';
import 'package:ecommerce_app/features/auth/domain/repository/auth_repo.dart';

class SignupUsecase {
  AuthRepo authRepo;
  SignupUsecase(this.authRepo);
  Future<Either<AuthModel, Failures>> call(SignupRequestModel request) async {
    return await authRepo.signup(request: request);
  }
}
